#ifndef PYR_SCENE_H
#define PYR_SCENE_H


#include <map>
#include <memory>
#include <gltext.h>
#include "Map.h"
#include "ScopedPtr.h"
#include "Types.h"
#include "PhysicsEngine.h"

namespace pyr {

    class ClientEntity;
    class Texture;

    class Scene {
    public:
        Scene();
        ~Scene() { }
        
        void draw(gltext::FontRendererPtr rend);
        void update(float dt);

        void setMap(const string& map);

        void addEntity(u16 id, ClientEntityPtr entity);
        void removeEntity(u16 id);
        ClientEntityPtr getEntity(u16 id) const;

        void clear();

        void setFocus(u16 id);
        ClientEntityPtr getFocus() const;

        void toggleWireframe();
        void toggleNormals();
        void toggleCollision();
        void toggleLighting() { _lighting = !_lighting; }
        
    private:
        void drawMap(Vec2f ll, Vec2f rr);
        void addParticles(MapElementPtr elt);

        typedef std::map<u16, ClientEntityPtr> EntityMap;

        ClientEntityPtr _focus;
        Texture* _backdrop;
        EntityMap _entities;
        CollisionData _coldata;
        MapPtr _map;

        Inited<bool, false> _wireframe;
        Inited<bool, false> _normals;
        Inited<bool, false> _collision;
        Inited<bool, true>  _lighting;
    };

}


#endif
