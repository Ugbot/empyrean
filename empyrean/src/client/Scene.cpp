#include <stdexcept>
#include "ClientEntity.h"
#include "Collider.h"
#include "GLUtility.h"
#include "Environment.h"
#include "MapLoader.h"
#include "MapRenderer.h"
#include "ParticleEmitter.h"
#include "ParticleSystem.h"
//#include "PhysicsEngine.h"
#include "Profiler.h"
#include "Scene.h"
#include "Texture.h"


namespace pyr {

    Scene::Scene() {
        _backdrop = Texture::create("images/stars.tga");
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

        glEnable(GL_NORMALIZE);
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

        glDisable(GL_DEPTH_TEST);
        
        /*glColor3f(1, 0, 0);  FIX THIS ...
        glBegin(GL_POINTS);
        for(size_t i = 0; i < _coldata.points.size(); i++) {
            glVertex(_coldata.points[i]);
        }
        glEnd();*/

        glEnable(GL_TEXTURE_2D);

        (_lighting ? glEnable : glDisable)(GL_LIGHTING);

        glEnable(GL_LIGHT0);
        float pos0[] = {1, 1, 1, 0};
        float specular0[] = {0, 0, 0, 0};
        float diffuse0[] =  {0.4f, 0.8f, 1.0f, 1.0f};
        float ambient0[] =  {0, 0, 0, 0};
        glLightfv(GL_LIGHT0, GL_POSITION, pos0);
        glLightfv(GL_LIGHT0, GL_SPECULAR, specular0);
        glLightfv(GL_LIGHT0, GL_DIFFUSE,  diffuse0);
        glLightfv(GL_LIGHT0, GL_AMBIENT,  ambient0);

        if (_focus) {
            float pos[4] = {focusX, focusY + 2, 5, 1};
            float diffuse[4] = {1,0,0,1};
            float specular[4] = {1,0,0,1};
            float ambient[4] = {1,1,1,1};
            glEnable(GL_LIGHT1);
            glLightfv(GL_LIGHT1, GL_POSITION, pos);
            glLightfv(GL_LIGHT1, GL_SPECULAR, specular);
            glLightfv(GL_LIGHT1, GL_DIFFUSE, diffuse);
            glLightfv(GL_LIGHT1, GL_AMBIENT, ambient);
        } else {
            glDisable(GL_LIGHT1);
        }

        drawMap();

        (_lighting ? glEnable : glDisable)(GL_LIGHTING);

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
        env.entities = EntityList(entityVector.begin(), entityVector.end());

        // Update all entities behaviors
        for (EntityMap::iterator itr = _entities.begin();
            itr != _entities.end(); ++itr) {
            itr->second->update(dt, env);
            entityVector.push_back(itr->second.get());
        }
        
        // Move the entities 
        //moveEntities(dt,_map.get(),entityVector,_coldata);

#if 0
        if (_map.get()) {
            resolveCollisions(dt, _map.get(), entityVector);
        }
#endif
    }
    
    void Scene::setMap(const string& map) {
        // Throws an exception.
        _map = loadMap(map);
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

    void Scene::toggleWireframe() {
        _wireframe = !_wireframe;
    }

    void Scene::toggleNormals() {
        _normals = !_normals;
    }

    void Scene::toggleCollision() {
        _collision = !_collision;
    }

    void Scene::drawMap() {
        PYR_PROFILE_BLOCK("Scene::drawMap");
        if (_map) {
            MapRenderer renderer;
            renderer.drawWireframe(_wireframe);
            renderer.drawNormals(_normals);
            _map->handleVisitor(renderer);

            if (_collision) {
                glDisable(GL_DEPTH_TEST);
                glDisable(GL_LIGHTING);
                if (ClientEntityPtr f = getFocus()) {
                    std::vector<Segment> segs;
                    _map->getSegs(segs, f->getPos()[0]);
                    glColor3f(0, 0, 1);
                    glBegin(GL_LINES);
                    for (size_t i = 0; i < segs.size(); ++i) {
                        glVertex(segs[i].v1);
                        glVertex(segs[i].v2);
                    }
                    glEnd();
                }
                glEnable(GL_LIGHTING);
                glEnable(GL_DEPTH_TEST);
            }
        }
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
