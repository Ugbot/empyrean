#include <stdexcept>
#include "Connection.h"
#include "Collider.h"
#include "CollisionBox.h"
#include "Game.h"
#include "MapLoader.h"
#include "PacketTypes.h"
#include "PlayerBehavior.h"
#include "ServerAppearance.h"
#include "ServerEntity.h"
#include "Monster.h"
#include "Die.h"

namespace pyr {

    Game::Game(const std::string& name, const std::string& password) {
        _name = name;
        _password = password;

        _map = loadMap("maps/map2.obj");
        if (!_map) {
            throw std::runtime_error("Loading maps/map1.obj failed");
        }
        
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

    Game::~Game() {
        clearConnections();
    }

    void Game::update(float dt) {
        ConnectionHolder::update();

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

        resolveCollisions(dt, _map.get(),entityVector);

        for (size_t i = 0; i < _entities.size(); ++i) {
            // Send all appearance updates to all of the clients.
            ServerAppearance* appearance = _entities[i]->getServerAppearance();
            std::vector<Packet*> packets;
            appearance->sendAppearanceChanges(_entities[i]->getID(), packets);
            for (size_t i = 0; i < packets.size(); ++i) {
                sendAll(packets[i]);
            }
        }

        for (size_t i = 0; i < _entities.size(); ++i) {
            ServerEntityPtr e = _entities[i];
            sendAll(new EntityUpdatedPacket(
                        e->getID(), e->getPos(), e->getVel()));
        }
    }

    GameConnectionData* Game::getData(Connection* c) {
        return checked_cast<GameConnectionData*>(c->getData());
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

        // Add packet handlers.
        connection->definePacketHandler(this, &Game::handlePlayerEvent);
        connection->definePacketHandler(this, &Game::handleHUDUpdate);
        connection->definePacketHandler(this, &Game::handlePlayerAttack);

        addEntity(entity);

        // Add player entity to other clients.
        sendAll(buildEntityAddedPacket(entity));

        // Send all entities to the new connection.
        for (size_t i = 0; i < _entities.size(); ++i) {
            connection->sendPacket(buildEntityAddedPacket(_entities[i]));
        }
        
        connection->sendPacket(new SetPlayerPacket(entity->getID()));

        // Send the client its character stats
        connection->sendPacket(new CharacterUpdatedPacket( entity->getID(),
                                                           entity->getGameStats()->getCurrentVitality(),
                                                           entity->getGameStats()->getMaxVitality(),
                                                           entity->getGameStats()->getCurrentEther(),
                                                           entity->getGameStats()->getMaxEther()        ));
    }

    void Game::connectionRemoved(Connection* connection) {
        GameConnectionData* cd = getData(connection);
        PYR_ASSERT(cd, "No ConnectionData.  connectionRemoved() called before connectionAdded()?");

        // Why do we send it to all connections, and then the connection passed?
        // Is the passed connection removed before calling this function?
        sendAll(new EntityRemovedPacket(cd->playerEntity->getID()));
        connection->sendPacket(new EntityRemovedPacket(
                                   cd->playerEntity->getID()));

        _idGenerator.release(cd->playerEntity->getID());
        removeEntity(cd->playerEntity);
        // Don't need to delete the behavior, because the entity does
        // that for us.

        // Maybe this will need to specifically unregister handlers as
        // opposed to clearing them all.
        connection->clearHandlers();
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

    void Game::handlePlayerAttack(Connection* c, PlayerAttackPacket* p) {
        GameConnectionData* cd = getData(c);
        ServerEntity* attacker = cd->playerEntity;
        PYR_ASSERT(attacker, "GameConnectionData does not have an associated entity");
        PlayerBehavior* attackerBehavior = cd->behavior;
        PYR_ASSERT(attackerBehavior, "GameConnectionData does not have an associated entity");

        float damageMod = 1.0f;

        if(p->name() == "Double") {
            damageMod = 6.0f;
            PYR_LOG() << "Double";
        }
        else if(p->name() == "Super") {
            damageMod = 10.0f;
            PYR_LOG() << "Triple";
        }
        else if(p->name() == "Mix Attack") {
            damageMod = 4.0f;
            PYR_LOG() << "Jump Attack";
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
                if (attackArea.findCollision(sidesHit,otherEntityBox,rv.points)) {
                    // An entity is potentially hit!
                    PYR_LOG() << "Found a potential hit!! ";

                    // Determine the location and hitMod of the hit location
                    /*int hitModifier = */getHitModifier(attackArea,p->type(),rv.points);

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
                    PYR_LOG() << "Attacker Score = " << attackScore;
                    PYR_LOG() << "Defender Score = " << defenderScore;

                    // If the attacker does hit, do damage
                    if (attackScore >= defenderScore) {
                        int abilityMod = p->type() == "Melee" ? attacker->getGameStats()->getStrength() :
                                                                attacker->getGameStats()->getAgility();
            
                        int damage = (int) ( (the<Die>().roll(minWpnDmg,maxWpnDmg) + abilityMod) * 
                                            ((float)wpnDmgMult/(float)armDmgDiv)                   );
                        
                        damage = (int) (damage * damageMod);
                        
                        PYR_LOG() << "Did damage = " << damage;
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
        PlayerBehavior* behavior = cd->behavior;
        Entity* entity = cd->playerEntity;
        behavior->handleEvent(entity, p->event());
    }

    void Game::handleHUDUpdate(Connection* c, TempHUDPacket* p) {
        // Update the character
        GameConnectionData* cd = getData(c);
        ServerEntity* entity = dynamic_cast<ServerEntity*>(cd->playerEntity);
        entity->getGameStats()->changeVitality(p->addVit() == 0 ? -p->decVit() : p->addVit());
        entity->getGameStats()->changeEther(p->addEth() == 0 ? -p->decEth() : p->addEth());

        // Send the change
        c->sendPacket(new CharacterUpdatedPacket( entity->getID(),
                                                  entity->getGameStats()->getCurrentVitality(),
                                                  entity->getGameStats()->getMaxVitality(),
                                                  entity->getGameStats()->getCurrentEther(),
                                                  entity->getGameStats()->getMaxEther()        ));
    }

}
