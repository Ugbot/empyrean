#include <stdexcept>
#include "Connection.h"
#include "Collider.h"
#include "CollisionBox.h"
#include "Configuration.h"
#include "Environment.h"
#include "Game.h"
#include "MapLoader.h"
#include "PacketTypes.h"
#include "PhysicsEngine.h"
#include "PlayerBehavior.h"
#include "ServerAppearance.h"
#include "ServerEntity.h"
#include "Monster.h"
#include "Die.h"

namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.Game");
    }

    struct EntityState {
        EntityState(ServerEntityPtr e)
        : entity(e)
        , id(e->getID())
        , pos(e->getPos())
        , vel(e->getVel())
        , bounds(e->getBounds()) {
        }

        bool operator<(const EntityState& rhs) const {
            return id < rhs.id;
        }

        bool operator!=(const EntityState& rhs) const {
            return id     != rhs.id  ||
                   pos    != rhs.pos ||
                   vel    != rhs.vel ||
                   bounds != rhs.bounds;
        }

        ServerEntityPtr entity;
        u16 id;
        Vec2f pos;
        Vec2f vel;
        BoundingRectangle bounds;
    };

    typedef std::set<EntityState> EntityStateSet;
    typedef EntityStateSet::iterator EntityStateSetIter;
    typedef EntityStateSet::const_iterator EntityStateSetCIter;

    struct WorldAspect {
        string map;
        EntityStateSet entities;
    };

    /// While in a game, extra data is needed.
    struct GameConnectionData : public ServerConnectionData {
        GameConnectionData() {
            behavior = 0;
        }

        GameConnectionData(const ServerConnectionData& rhs)
        : ServerConnectionData(rhs) {
            behavior = 0;
        }

        GameConnectionData(const GameConnectionData& rhs)
        : ServerConnectionData(rhs) {
            playerEntity = rhs.playerEntity;
            behavior = rhs.behavior;
        }

        ServerEntityPtr playerEntity;
        PlayerBehaviorPtr behavior;
        Inited<bool, false> acceptingUpdates;
        WorldAspect aspect;
    };


    Game::Game(const std::string& name, const std::string& password) {
        PYR_LOG_SCOPE(_logger, INFO, "Game::Game");

        definePacketHandler(this, &Game::handleAllowUpdates);
        definePacketHandler(this, &Game::handlePlayerEvent);
        definePacketHandler(this, &Game::handleHUDUpdate);
        definePacketHandler(this, &Game::handlePlayerAttack);

        _name = name;
        _password = password;

        loadGameResources();
    }

    Game::~Game() {
        PYR_LOG_SCOPE(_logger, INFO, "Game::~Game");

        clearConnections();
    }

    void Game::update(float dt) {
        PYR_LOG_SCOPE(_logger, INFO, "Game::update");
        
        // Process packets from all connections.
        ConnectionHolder::update();
        updateWorld(dt);
        updateConnections();
    }

    GameConnectionData* Game::getData(Connection* c) {
        return checked_cast<GameConnectionData*>(c->getData());
    }
    
    void Game::loadGameResources() {
        _map = loadMap(the<Configuration>().map);

        // Find start position.
        MapElementPtr start = _map->findElementByName("start");
        if (start) {
            _startPosition = start->pos;
        }

        // Find monsters.
        std::vector<MapElementPtr> elements;
        _map->getAllElements(elements);
        for (size_t i = 0; i < elements.size(); ++i) {
            MapElementPtr elt = elements[i];
            if (elt->properties["enemy"] == "true") {
                ServerEntity* entity = new ServerEntity(
                    _idGenerator.reserve(),
                    instantiateBehavior("monster"),
                    new ServerAppearance("cal3d",
                                         "models/paladin/paladin.cal3d"),
                    new Monster());

                float width  = 0.3f;
                float height = 1.9f;
                entity->setBounds(BoundingRectangle(Vec2f(-width / 2, 0),
                                                    Vec2f(width / 2, height)));
                entity->setPos(elt->pos);
                addEntity(entity);
            } else if (elt->properties["entity"] == "true") {
                ServerEntity* entity = new ServerEntity(
                    _idGenerator.reserve(),
                    instantiateBehavior(elt->properties["behavior"],
                                        elt->properties["behaviorResource"]),
                    new ServerAppearance(elt->properties["appearance"],
                                         elt->properties["appearanceResource"]),
                    new Monster());

                float width  = 0.3f;
                float height = 1.9f;
                entity->setBounds(BoundingRectangle(Vec2f(-width / 2, 0),
                                                    Vec2f(width / 2, height)));
                entity->setPos(elt->pos);
                addEntity(entity);
            }
        }
    }
    
    void Game::updateWorld(float dt) {
        Environment env;
        env.map = _map.get();
        for (size_t i = 0; i < _entities.size(); ++i) {
            env.entities.push_back(_entities[i].get());
        }

        std::vector<Entity*> entityVector;
        for (size_t i = 0; i < _entities.size(); ++i) {
            _entities[i]->update(dt, env);
            entityVector.push_back(_entities[i].get());
        }

        CollisionData temp;
        moveEntities(dt,_map.get(),entityVector,temp);

        // If we fall off of the world, get pushed back up.  :)
        for (size_t i = 0; i < _entities.size(); ++i) {
            EntityPtr e = _entities[i];
            if (e->getPos()[1] < -1000) {
                e->getPos()[1] = +1000;
            }
        }

        for(size_t i = 0; i < _entities.size(); ++i) {
            ServerEntityPtr e = _entities[i];
            // check if it's behavior is attacking - should only happen for monsters
            BehaviorPtr b = e->getBehavior();
            if(b->isAttacking()) {
                handleMonsterAttack(e);
            }
        }
    }

    void Game::updateConnections() {
        // Calculate authoritative world state.
        WorldAspect aspect;
        aspect.map = the<Configuration>().map;

        for (size_t i = 0; i < _entities.size(); ++i) {
            aspect.entities.insert(EntityState(_entities[i]));
        }

        // Update connections.
        for (size_t i = 0; i < getConnectionCount(); ++i) {
            updateConnection(aspect, getConnection(i));
        }

        // Clear appearance changes for this frame.
        for (size_t i = 0; i < _entities.size(); ++i) {
            ServerAppearancePtr appearance = _entities[i]->getServerAppearance();
            appearance->clearAppearanceChanges();
        }
    }

    void Game::updateConnection(const WorldAspect& aspect, Connection* c) {
        GameConnectionData* cd = getData(c);
        if (!cd->acceptingUpdates) {
            return;
        }

        // Send difference between client aspect and world.

        if (aspect.map != cd->aspect.map) {
            c->sendPacket(new SetMapPacket(aspect.map));
        }

        EntityStateSetCIter clientIter = cd->aspect.entities.begin();
        EntityStateSetCIter clientEnd  = cd->aspect.entities.end();
        EntityStateSetCIter serverIter = aspect.entities.begin();
        EntityStateSetCIter serverEnd  = aspect.entities.end();

        while (clientIter != clientEnd || serverIter != serverEnd) {
            if (serverIter == serverEnd || clientIter->id < serverIter->id) {
                // Client has entity that server doesn't.  Remove and increment client.
                c->sendPacket(new EntityRemovedPacket(clientIter->id));

                ++clientIter;

            } else if (clientIter == clientEnd || clientIter->id > serverIter->id) {
                ServerEntityPtr entity = serverIter->entity;

                // Server has entity that client doesn't.  Add and increment server.
                c->sendPacket(buildEntityAddedPacket(entity));

                // EntityAddedPacket doesn't have pos/vel.
                c->sendPacket(new EntityUpdatedPacket(
                    entity->getID(), entity->getPos(), entity->getVel()));

                // If this is the player's own entity, do special things.
                if (entity == cd->playerEntity) {
                    c->sendPacket(new SetPlayerPacket(entity->getID()));

                    // Send the client its character stats
                    c->sendPacket(new CharacterUpdatedPacket(
                        entity->getID(),
                        entity->getGameStats()->getCurrentVitality(),
                        entity->getGameStats()->getMaxVitality(),
                        entity->getGameStats()->getCurrentEther(),
                        entity->getGameStats()->getMaxEther()));
                }

                ++serverIter;
            } else {
                // Entities match.  Compare and increment both.
                if (*clientIter != *serverIter) {
                    ServerEntityPtr e = serverIter->entity;
                    c->sendPacket(new EntityUpdatedPacket(
                        e->getID(), e->getPos(), e->getVel()));
                }
                
                ++clientIter;
                ++serverIter;
            }
        }
        
        cd->aspect = aspect;
        
        for (size_t i = 0; i < _entities.size(); ++i) {
            // Send all appearance updates to all of the clients.
            ServerAppearancePtr appearance = _entities[i]->getServerAppearance();
            std::vector<Packet*> packets;
            appearance->sendAppearanceChanges(_entities[i]->getID(), packets);
            c->sendPackets(packets);
        }
    }

    void Game::addEntity(ServerEntityPtr entity) {
        _entities.push_back(entity);
    }

    void Game::removeEntity(ServerEntityPtr entity) {
        for (size_t i = 0; i < _entities.size(); ++i) {
            if (_entities[i] == entity) {
                _entities.erase(_entities.begin() + i);
                return;
            }
        }
    }

    EntityAddedPacket* Game::buildEntityAddedPacket(ServerEntityPtr entity) {
        return new EntityAddedPacket(
            entity->getID(),
            entity->getBehavior()->getName(),
            entity->getBehavior()->getResource(),
            entity->getAppearance()->getName(),
            entity->getAppearance()->getResource(),
            entity->getBounds().min,
            entity->getBounds().max);
    }

    void Game::connectionAdded(Connection* connection) {
        // Not using checked_cast here because the error message wouldn't be as descriptive.
        ServerConnectionData* scd = dynamic_cast<ServerConnectionData*>(connection->getData());
        PYR_ASSERT(scd, "Connection data in game is not set.  Maybe connection " \
                        "was added to Game without going through Server?");

        GameConnectionData* cd = new GameConnectionData(*scd);

        PlayerBehavior* pb = new PlayerBehavior("");
        ServerEntity* entity = new ServerEntity(
            _idGenerator.reserve(),
            pb,
            new ServerAppearance("cal3d", "models/paladin/paladin.cal3d"),
            // Just pick a character.
            cd->account->getCharacter(0));
        entity->setPos(_startPosition);
        // Hardcoded for now.  Hardcoded in the client as well.
        float width  = 0.3f;
        float height = 1.9f;
        entity->setBounds(BoundingRectangle(Vec2f(-width / 2, 0), Vec2f(width / 2, height)));

        // Set connection-specific data.
        cd->playerEntity = entity;
        cd->behavior = pb;
        connection->setData(cd);

        addEntity(entity);
    }

    void Game::connectionRemoved(Connection* connection) {
        GameConnectionData* cd = getData(connection);
        PYR_ASSERT(cd, "No ConnectionData.  connectionRemoved() called before connectionAdded()?");

        _idGenerator.release(cd->playerEntity->getID());
        removeEntity(cd->playerEntity);
    }

    int Game::getHitModifier(CollisionBox& box, const std::string& attackType, std::vector<Vec2f>& points) {
        float hitLocX = 0.0f;
        float hitLocY = 0.0f;
        for (size_t j=0; j < points.size(); j++) {
            hitLocX += points[j][0];
            hitLocY += points[j][1];
        }
        hitLocX /= points.size();  // get average hit x val
        hitLocY /= points.size();  // get average hit y val
        if (attackType == "Melee") {
            if (hitLocX < box.getCenter()[0]) {
                if (hitLocY < 0.25*(box[2][1]-box[0][1])) {
                    return -20;
                }
                else if (hitLocY < 0.75*(box[2][1]-box[0][1])) {
                    return -15;
                }
                else {
                    return -35;
                }
            }
            else {
                if (hitLocY < 0.25*(box[2][1]-box[0][1])) {
                    return 10;
                }
                else if (hitLocY < 0.75*(box[2][1]-box[0][1])) {
                    return 5;
                }
                else {
                    return -10;
                }
            }
        }
        else {
            if (hitLocX < box.getCenter()[0]) {
                return -50;
            }
            else {
                if (hitLocY < 0.25*(box[2][1]-box[0][1])) {
                    return 10;
                }
                else if (hitLocY < 0.75*(box[2][1]-box[0][1])) {
                    return 5;
                }
                else {
                    return -10;
                }
            }
        }
    }
    
    void Game::handleAllowUpdates(Connection* c, AllowUpdatesPacket* p) {
        _logger.log(INFO, "Allowing updates for connection");
        getData(c)->acceptingUpdates = true;  // maybe allow it to turn off later.
    }

    void Game::handleMonsterAttack(ServerEntityPtr attacker)
    {
        float damageMod = 5.0f;
        string type = "Melee";
        BehaviorPtr attackerBehavior = attacker->getBehavior();

        // Get the bounding box of the attack - dumb this time - attacking both sides
        BoundingRectangle attackAreaR = attacker->getBounds();
        attackAreaR.min[0] -= 0.5f;
        attackAreaR.max[0] += 0.5f;

        BoundingRectangle attackArea(
            attacker->getPos() + attackAreaR.min,
            attacker->getPos() + attackAreaR.max);
        
        // See if the attack hits any other entities
        std::vector<ServerEntityPtr> entitiesToClean;
        for (size_t i=0; i < _entities.size(); i++) {
            if (_entities[i] != attacker) {
                BoundingRectangle otherEntityBox(
                    _entities[i]->getPos() + _entities[i]->getBounds().min, 
                    _entities[i]->getPos() + _entities[i]->getBounds().max);
                
                if (attackArea.intersects(otherEntityBox)) {
                    // An entity is potentially hit!
                    _logger.log(WARN, "Found a potential hit!! ");

                    // Determine the location and hitMod of the hit location
                    //getHitModifier(attackArea,type,points);

                    // Get the weapon and armor stats of the combatants
                    int minWpnDmg,maxWpnDmg,wpnDmgMult,wpnAccuracy = 0;
                    attacker->getGameStats()->getEquippedWeaponStats(minWpnDmg,maxWpnDmg,
                                                                    wpnDmgMult,wpnAccuracy);
                    int armDmgDiv, armDef = 0;
                    _entities[i]->getGameStats()->getEquippedArmorStats(armDef,armDmgDiv);

                    // Determine the appropriate skill modifier (for now use Rush) - will be based on attack type
                    int attSkillMod = 5*attacker->getGameStats()->getRushSkill();

                    // See if the attacker scores a hit
                    int attackScore = the<Die>().roll(1,50) + attacker->getGameStats()->getAgility() +
                                    wpnAccuracy + attSkillMod;
                    int defenderScore = the<Die>().roll(11,60) + _entities[i]->getGameStats()->getAgility() +
                                        armDef + 5*_entities[i]->getGameStats()->getDodgeSkill();
                    PYR_LOG(_logger, WARN, "Attacker Score = " << attackScore);
                    PYR_LOG(_logger, WARN, "Defender Score = " << defenderScore);

                    // If the attacker does hit, do damage
                    if (attackScore >= defenderScore) {
                        int abilityMod = type == "Melee" ? attacker->getGameStats()->getStrength() :
                                                                attacker->getGameStats()->getAgility();
            
                        int damage = (int) ( (the<Die>().roll(minWpnDmg,maxWpnDmg) + abilityMod) * 
                                            ((float)wpnDmgMult/(float)armDmgDiv)                   );
                        
                        damage = (int) (damage * damageMod);
                        
                        PYR_LOG(_logger, WARN, "Did damage = " << damage);
                        _entities[i]->getGameStats()->changeVitality(-damage);
                        sendAll(new CharacterUpdatedPacket( _entities[i]->getID(),
                                                            _entities[i]->getGameStats()->getCurrentVitality(),
                                                            _entities[i]->getGameStats()->getMaxVitality(),
                                                            _entities[i]->getGameStats()->getCurrentEther(),
                                                            _entities[i]->getGameStats()->getMaxEther()        ));
                    }

                    // See if the target has died, and if so inform everyone
                    if (_entities[i]->getGameStats()->getCurrentVitality() < 1) {
                        //sendAll(new EntityRemovedPacket(_entities[i]->getID()));
                        entitiesToClean.push_back(_entities[i]);
                    }
                }
            }
        }

        // Clean up dead entities
        for (size_t i=0; i < entitiesToClean.size(); i++) {
            _idGenerator.release(entitiesToClean[i]->getID());
            removeEntity(entitiesToClean[i]);
            entitiesToClean[i] = 0;
        }
    }

    void Game::handlePlayerAttack(Connection* c, PlayerAttackPacket* p) {
        GameConnectionData* cd = getData(c);
        ServerEntityPtr attacker = cd->playerEntity;
        PYR_ASSERT(attacker, "GameConnectionData does not have an associated entity");
        PlayerBehaviorPtr attackerBehavior = cd->behavior;
        PYR_ASSERT(attackerBehavior, "GameConnectionData does not have an associated entity");

        float damageMod = 5.0f;

        if(p->name() == "Double") {
            damageMod = 6.0f;
            _logger.log(INFO, "Double");
        }
        else if(p->name() == "Super") {
            damageMod = 10.0f;
            _logger.log(INFO, "Triple");
        }
        else if(p->name() == "Mix Attack") {
            damageMod = 4.0f;
            _logger.log(INFO, "Jump Attack");
        }

        // Get the bounding box of the attack
        Vec2f lowerLeft, upperRight;
        if (attackerBehavior->facingRight()) {
            lowerLeft = attacker->getPos() + Vec2f(attacker->getBounds().getWidth()/2.0f,
                                                   attacker->getBounds().getHeight()/2.0f);
            upperRight = attacker->getPos() + attacker->getBounds().max + 
                         Vec2f(attacker->getBounds().getHeight(), 0.0f);
        }
        else {
            lowerLeft = attacker->getPos() + attacker->getBounds().min +
                        Vec2f(-attacker->getBounds().getHeight(),attacker->getBounds().getHeight()/2.0f);
            upperRight = attacker->getPos() + attacker->getBounds().min +
                        Vec2f(0.0f, attacker->getBounds().getHeight());
        }
        CollisionBox attackArea(lowerLeft,upperRight);
        
        // See if the attack hits any other entities
        std::vector<CollisionBox::Side> sidesHit;
        std::vector<ServerEntityPtr> entitiesToClean;
        for (size_t i=0; i < _entities.size(); i++) {
            if (_entities[i] != attacker) {
                CollisionBox otherEntityBox(_entities[i]->getPos() + _entities[i]->getBounds().min, 
                                            _entities[i]->getPos() + _entities[i]->getBounds().max );
                
                CollisionData rv;
                std::vector<Vec2f> points;
                if (attackArea.findCollision(sidesHit,otherEntityBox,points)) {
                    // An entity is potentially hit!
                    _logger.log(INFO, "Found a potential hit!! ");

                    // Determine the location and hitMod of the hit location
                    /*int hitModifier = */getHitModifier(attackArea,p->type(),points);

                    // Get the weapon and armor stats of the combatants
                    int minWpnDmg,maxWpnDmg,wpnDmgMult,wpnAccuracy = 0;
                    attacker->getGameStats()->getEquippedWeaponStats(minWpnDmg,maxWpnDmg,
                                                                    wpnDmgMult,wpnAccuracy);
                    int armDmgDiv, armDef = 0;
                    _entities[i]->getGameStats()->getEquippedArmorStats(armDef,armDmgDiv);

                    // Determine the appropriate skill modifier (for now use Rush) - will be based on attack type
                    int attSkillMod = 5*attacker->getGameStats()->getRushSkill();

                    // See if the attacker scores a hit
                    int attackScore = the<Die>().roll(1,50) + attacker->getGameStats()->getAgility() +
                                    wpnAccuracy + /*hitModifier +*/ attSkillMod;
                    int defenderScore = the<Die>().roll(11,60) + _entities[i]->getGameStats()->getAgility() +
                                        armDef + 5*_entities[i]->getGameStats()->getDodgeSkill();
                    PYR_LOG(_logger, INFO, "Attacker Score = " << attackScore);
                    PYR_LOG(_logger, INFO, "Defender Score = " << defenderScore);

                    // If the attacker does hit, do damage
                    if (attackScore >= defenderScore) {
                        int abilityMod = p->type() == "Melee" ? attacker->getGameStats()->getStrength() :
                                                                attacker->getGameStats()->getAgility();
            
                        int damage = (int) ( (the<Die>().roll(minWpnDmg,maxWpnDmg) + abilityMod) * 
                                            ((float)wpnDmgMult/(float)armDmgDiv)                   );
                        
                        damage = (int) (damage * damageMod);
                        
                        PYR_LOG(_logger, INFO, "Did damage = " << damage);
                        _entities[i]->getGameStats()->changeVitality(-damage);
                        sendAll(new CharacterUpdatedPacket( _entities[i]->getID(),
                                                            _entities[i]->getGameStats()->getCurrentVitality(),
                                                            _entities[i]->getGameStats()->getMaxVitality(),
                                                            _entities[i]->getGameStats()->getCurrentEther(),
                                                            _entities[i]->getGameStats()->getMaxEther()        ));
                    }

                    // See if the target has died, and if so inform everyone
                    if (_entities[i]->getGameStats()->getCurrentVitality() < 1) {
                        sendAll(new EntityRemovedPacket(_entities[i]->getID()));
                        entitiesToClean.push_back(_entities[i]);
                    }
                }
            }
        }

        // Clean up dead entities
        for (size_t i=0; i < entitiesToClean.size(); i++) {
            _idGenerator.release(entitiesToClean[i]->getID());
            removeEntity(entitiesToClean[i]);
            entitiesToClean[i] = 0;
        }
    }

    void Game::handlePlayerEvent(Connection* c, PlayerEventPacket* p) {
        GameConnectionData* cd = getData(c);
        PlayerBehaviorPtr behavior = cd->behavior;
        Entity* entity = cd->playerEntity.get();
        behavior->handleEvent(entity, p->event());
    }

    void Game::handleHUDUpdate(Connection* c, TempHUDPacket* p) {
        // Update the character
        GameConnectionData* cd = getData(c);
        ServerEntity* entity = dynamic_cast<ServerEntity*>(cd->playerEntity.get());
        entity->getGameStats()->changeVitality(p->addVit() == 0 ? -p->decVit() : p->addVit());
        entity->getGameStats()->changeEther(p->addEth() == 0 ? -p->decEth() : p->addEth());

        // Send the change
        c->sendPacket(new CharacterUpdatedPacket(
            entity->getID(),
            entity->getGameStats()->getCurrentVitality(),
            entity->getGameStats()->getMaxVitality(),
            entity->getGameStats()->getCurrentEther(),
            entity->getGameStats()->getMaxEther()));
    }

}
