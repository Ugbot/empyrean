#include <stdexcept>
#include "ClientEntity.h"
#include "Collider.h"
#include "GLUtility.h"
#include "MapLoader.h"
#include "MapRenderer.h"
#include "ParticleEmitter.h"
#include "ParticleSystem.h"
#include "Profiler.h"
#include "Scene.h"
#include "Texture.h"


namespace pyr {

    Scene::Scene() {
        _backdrop = Texture::create("images/stars.tga");
        _map = loadMap("maps/map2.obj");
    }

    void Scene::draw(gltext::FontRendererPtr rend) {
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
        drawMap();

        glEnable(GL_TEXTURE_2D);

        glEnable(GL_LIGHTING);
        //glEnable(GL_LIGHT0);

        glEnable(GL_LIGHT1);
        if (_focus) {
            glPointSize(5);
            glBegin(GL_POINTS);
            glVertex3f(focusX, focusY, -2);
            glEnd();

            float pos[4] = {focusX, focusY, -1, 1};
            float diffuse[4] = {1,0,0,1};
            float specular[4] = {1,0,0,1};
            float ambient[4] = {1,1,1,1};
            glLightfv(GL_LIGHT1, GL_POSITION, pos);
            glLightfv(GL_LIGHT1, GL_SPECULAR, specular);
            glLightfv(GL_LIGHT1, GL_DIFFUSE, diffuse);
            glLightfv(GL_LIGHT1, GL_AMBIENT, ambient);
        }

        EntityMap::iterator itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            ClientEntityPtr e = itr->second;
            glPushMatrix();
            glTranslate(e->getPos());
            e->draw(rend);
            glPopMatrix();
        }

        glDisable(GL_LIGHTING);
        glDisable(GL_LIGHT0);
        glDisable(GL_DEPTH_TEST);
    }

    void Scene::update(float dt) {
        PYR_PROFILE_BLOCK("Scene::update");
        std::vector<Entity*> entityVector;

        for (EntityMap::iterator itr = _entities.begin();
             itr != _entities.end(); ++itr) {
            entityVector.push_back(itr->second.get());
        }

        Environment env;
        env.map = _map.get();
        env.entities = std::vector<const Entity*>(entityVector.begin(), entityVector.end());


        // Update all entities (regardless of collision with others)
        for (EntityMap::iterator itr = _entities.begin();
            itr != _entities.end(); ++itr) {
            itr->second->update(dt, env);
            entityVector.push_back(itr->second.get());
        }

        resolveCollisions(dt,_map.get(),entityVector);

    }

    void Scene::addEntity(u16 id, ClientEntityPtr entity) {
        PYR_ASSERT(_entities.count(id) == 0, "Two entities have same ID");
        _entities[id] = entity;
    }

    void Scene::removeEntity(u16 id) {
        if (_focus && getEntity(id) == _focus) {
            _focus = 0;
        }
        _entities.erase(id);
    }
    
    ClientEntityPtr Scene::getEntity(u16 id) const {
        EntityMap::const_iterator i = _entities.find(id);
        return (i == _entities.end() ? 0 : i->second);
    }

    void Scene::clear() {
        _focus = 0;
        _entities.clear();
    }
    
    void Scene::setFocus(u16 id) {
        _focus = getEntity(id);
    }
    
    ClientEntityPtr Scene::getFocus() const {
        return _focus;
    }

    void Scene::drawMap() {
        PYR_PROFILE_BLOCK("Scene::drawMap");
        MapRenderer renderer;
        _map->handleVisitor(renderer);
    }

    void Scene::addParticles(MapElementPtr elt) {
        static u16 id = 65535;  /// @todo WARNING: HACK!
        // Yeah, the server should send these in, now that it has the
        // infrastructure.

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
