#include "Entity.h"
#include "GLUtility.h"
#include "Scene.h"
#include "Renderer.h"
#include "Texture.h"



namespace pyr {

    PYR_DEFINE_SINGLETON(Scene)

    Scene::Scene() {
        _backdrop = Texture::create("images/stars.tga");
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
        EntityMap::iterator itr = _entities.begin();
        for (; itr != _entities.end(); ++itr) {
            itr->second->update(dt);
        }
    }
    
    void Scene::addEntity(u16 id, Entity* entity) {
        PYR_ASSERT(_entities.count(id) == 0, "Two entities have same ID");
        _entities[id] = entity;
    }
    
    void Scene::removeEntity(u16 id) {
        _entities.erase(id);
    }
    
    Entity* Scene::getEntity(u16 id) {
        EntityMap::iterator i = _entities.find(id);
        return (i == _entities.end() ? 0 : i->second);
    }
    
}
