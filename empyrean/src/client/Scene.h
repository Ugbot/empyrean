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
        ~Scene() { }
        
    public:
        void draw(gltext::FontRendererPtr rend);
        void update(float dt);
        
        void addEntity(u16 id, ClientEntityPtr entity);
        void removeEntity(u16 id);
        ClientEntityPtr getEntity(u16 id) const;

        void clear();
        
        void setFocus(u16 id);
        ClientEntityPtr getFocus() const;
        
    private:
        void drawMap();
        void addParticles(MapElementPtr elt);

        typedef std::map<u16, ClientEntityPtr> EntityMap;

        ClientEntityPtr _focus;
        Texture* _backdrop;
        EntityMap _entities;
        ScopedPtr<Map> _map;
    };

}


#endif
