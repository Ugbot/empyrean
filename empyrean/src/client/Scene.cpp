#include "Entity.h"
#include "GLUtility.h"
#include "Scene.h"
#include "Renderer.h"
#include "Texture.h"

#include "Scene.h"
#include "MapFile.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(Scene)

    Scene::Scene() 
        : _backdrop(Texture::create("images/stars.png"))
    {
        //_map.reset(new MapFile);
        //_map->_terrain.images.push_back(MapFile::Image(0, 220, 400, 80));
        //_map->addRectangle(0, 220, 400, 300);
    }
    
    Scene::~Scene() {
        EntityMap::iterator itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            delete itr->second;
        }
    }
    
    void Scene::draw() {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0, 400, 300, 0, -100, 100);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        glDisable(GL_DEPTH_TEST);
        glEnable(GL_TEXTURE_2D);
        glDisable(GL_BLEND);

        glClear(GL_DEPTH_BUFFER_BIT);
        _backdrop->drawRectangle(0, 0, 400, 300);

        //_map->draw();
        
        glTranslatef(200, 150, 0);

        EntityMap::iterator itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            Entity* e = itr->second;
            glPushMatrix();
            glTranslate(e->getPos());
            e->draw();
            glPopMatrix();
        }
    }
    
    void Scene::update(float dt) {
        for (unsigned i = 0; i < _entities.size(); i++) {
            _entities[i]->update(dt);
        }
    }
    
    void Scene::addEntity(u16 id, Entity* entity) {
        if (_entities.count(id)) {
            delete _entities[id];
        }
        _entities[id] = entity;
    }
    
    void Scene::removeEntity(u16 id) {
        delete _entities[id];
        _entities.erase(id);
    }
    
    Entity* Scene::getEntity(u16 id) {
        EntityMap::iterator i = _entities.find(id);
        return (i == _entities.end() ? 0 : i->second);
    }
    
}
