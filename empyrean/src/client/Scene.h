#ifndef PYR_SCENE_H
#define PYR_SCENE_H


#include <map>
#include "Types.h"


namespace pyr {

    class Entity;
    class Texture;

    class Scene {
    public:
        static Scene& instance();
        
    private:
        static void destroy();
    
        Scene();
        ~Scene();
        
    public:
        void draw();
        void update(float dt);
        
        void addEntity(u16 id, Entity* entity);
        void removeEntity(u16 id);
        Entity* getEntity(u16 id);
        
    private:
        typedef std::map<u16, Entity*> EntityMap;
        
        static Scene* _instance;
    
        Texture* _backdrop;
        EntityMap _entities;
    };

}


#endif
