#include <stdexcept>
#include "ClientEntity.h"
#include "GameEntity.h"
#include "GLUtility.h"
#include "MapLoader.h"
#include "MapRenderer.h"
#include "ParticleEmitter.h"
#include "ParticleSystem.h"
#include "Renderer.h"
#include "Scene.h"
#include "Texture.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(Scene)

    Scene::Scene() {
        _focus = 0;
        _backdrop = Texture::create("images/stars.tga");
        _map = loadMap("maps/map1.obj");
        if (!_map) {
            throw std::runtime_error("Loading maps/map1.obj failed");
        }

        //addParticles(_map->getRoot());
    }
    
    Scene::~Scene() {
        EntityMap::iterator itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            delete itr->second;
        }
    }
    
    void Scene::draw() {
        // Nominal viewport is 12 meters wide and 9 meters high.
        const float width = 12.0f;
        const float height = 9.0f;
        setOrthoProjection(width, height, true);
        
        float focusX = 0;
        float focusY = 0;
        if (_focus) {
            focusX = _focus->getPos()[0];
            focusY = _focus->getPos()[1];
        }

        glDisable(GL_DEPTH_TEST);
        glDisable(GL_BLEND);

        glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);

        // draw background
        glEnable(GL_TEXTURE_2D);
        glColor3f(1, 1, 1);
        _backdrop->bind();
        glBegin(GL_TRIANGLE_FAN);
        glTexCoord2f(0 + focusX / width, 0 + focusY / height); glVertex2f(0,     0);
        glTexCoord2f(0 + focusX / width, 1 + focusY / height); glVertex2f(0,     height);
        glTexCoord2f(1 + focusX / width, 1 + focusY / height); glVertex2f(width, height);
        glTexCoord2f(1 + focusX / width, 0 + focusY / height); glVertex2f(width, 0);
        glEnd();
        
        glTranslatef(width / 2 - focusX, height / 4 - focusY, 0);

        glEnable(GL_DEPTH_TEST);

        glColor3f(1, 1, 1);
        glPointSize(5);
        MapRenderer renderer;
        _map->handleVisitor(renderer);

        glDisable(GL_DEPTH_TEST);
        
        glEnable(GL_TEXTURE_2D);

        EntityMap::iterator itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            ClientEntity* e = itr->second;
            glPushMatrix();
            glTranslate(e->getPos());
            e->draw();
            glPopMatrix();
        }
    }
    
    void Scene::update(float dt) {
        EntityMap::iterator itr = _entities.begin();
        // Update all entities (regardless of collision with others)
        for (; itr != _entities.end(); ++itr) {
            itr->second->update(dt,_map.get());
        }
        // Now that everyone has moved do a collision amongst entities (game entities that is)
        itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            GameEntity* gentity = dynamic_cast<GameEntity*>(itr->second);
            if(gentity) {
                gentity->collideWithOthers(_entities);
            }
        }
    }
    
    void Scene::addEntity(u16 id, ClientEntity* entity) {
        PYR_ASSERT(_entities.count(id) == 0, "Two entities have same ID");
        _entities[id] = entity;
    }
    
    void Scene::removeEntity(u16 id) {
        if (_focus && getEntity(id) == _focus) {
            _focus = 0;
        }
        _entities.erase(id);
    }
    
    ClientEntity* Scene::getEntity(u16 id) const {
        EntityMap::const_iterator i = _entities.find(id);
        return (i == _entities.end() ? 0 : i->second);
    }
    
    void Scene::setFocus(u16 id) {
        _focus = getEntity(id);
    }
    
    ClientEntity* Scene::getFocus() const {
        return _focus;
    }

    void Scene::addParticles(MapElementPtr elt) {
        static u16 id = 65535;  /// @todo WARNING: HACK!

        if (elt && elt->properties["particles"] == "true") {
            ParticleSystem* ps = new ParticleSystem;
            ps->setPos(elt->pos);
            addEntity(id--, ps);

            ParticleEmitter* pe = new ParticleEmitter(ps);
            pe->setVelocity(Vec2f(0, 1));
            pe->setAccel(Vec2f(0, -2));
            addEntity(id--, pe);
        }

        GroupElementPtr g = dynamic_cast<GroupElement*>(elt.get());
        if (g) {
            for (size_t i = 0; i < g->children.size(); ++i) {
                addParticles(g->children[i]);
            }
        }
    }
    
}
