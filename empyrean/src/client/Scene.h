#ifndef PYR_SCENE_H
#define PYR_SCENE_H


#include <map>
#include <memory>
#include <gltext.h>
#include "Map.h"
#include "ScopedPtr.h"
#include "Singleton.h"
#include "Types.h"


namespace pyr {

    class ClientEntity;
    class Map;
    class Texture;

    class Scene {
        PYR_DECLARE_SINGLETON(Scene)
    
        Scene();
        ~Scene();
        
    public:
        void draw(gltext::FontRendererPtr rend);
        void update(float dt);
        
        /** The scene takes ownership of entities that are given to it,
         *  unless they are removed. */
        void addEntity(u16 id, ClientEntity* entity);
        void removeEntity(u16 id);
        ClientEntity* getEntity(u16 id) const;

        void clear();
        
        void setFocus(u16 id);
        ClientEntity* getFocus() const;
        
    private:
        void addParticles(MapElementPtr elt);

        typedef std::map<u16, ClientEntity*> EntityMap;

        ClientEntity* _focus;
        Texture* _backdrop;
        EntityMap _entities;
        ScopedPtr<Map> _map;
    };

}


#endif
