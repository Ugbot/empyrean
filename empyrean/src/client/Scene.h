#ifndef PYR_SCENE_H
#define PYR_SCENE_H


#include <map>
#include "Singleton.h"
#include "Types.h"
#include "Utility.h"


namespace pyr {

    class Entity;
    class Texture;

    class Scene {
        PYR_DECLARE_SINGLETON(Scene)
    
        Scene();
        ~Scene();
        
    public:
        void draw();
        void update(float dt);
        
        /** The scene takes ownership of entities that are given to it,
         *  unless they are removed. */
        void addEntity(u16 id, Entity* entity);
        void removeEntity(u16 id);
        Entity* getEntity(u16 id) const;
        
        void setFocus(u16 id);
        Entity* getFocus() const;
        
    private:
        typedef std::map<u16, Entity*> EntityMap;

        Entity* _focus;
        Texture* _backdrop;
        EntityMap _entities;
    };

}


#endif
