#ifndef PYR_ENTITY_H
#define PYR_ENTITY_H


#include <list>
// Hm, I'm not sure why we need these here instead of in the source file.
#include "Appearance.h"
#include "Behavior.h"
#include "BoundingRectangle.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "ScopedPtr.h"
#include "VecMath.h"


namespace pyr {

    class Map;

    class Entity : public RefCounted {
    protected:
        virtual ~Entity() { }

    public:
        Entity(BehaviorPtr behavior, Appearance* appearance) {
            PYR_ASSERT(behavior,   "Behavior cannot be null");
            PYR_ASSERT(appearance, "Appearance cannot be null");
            _behavior   = behavior;
            _appearance = appearance;
        }

        /**
         * Updates the entity's behavior.  If you need to update something else,
         * override this.
         */
        virtual ActionQueue update(float dt, const Environment& env);

        Behavior*   getBehavior()   const { return _behavior.get();   }
        Appearance* getAppearance() const { return _appearance.get(); }

        void setPos(const Vec2f& pos) { _pos = pos;  }
        Vec2f& getPos()               { return _pos; }
        const Vec2f& getPos() const   { return _pos; }

        void setVel(const Vec2f& vel) { _vel = vel;  }
        Vec2f& getVel()               { return _vel; }
        const Vec2f& getVel() const   { return _vel; }

        void setBounds(const BoundingRectangle& br) { _bounds = br; }
        BoundingRectangle& getBounds()              { return _bounds; }
        const BoundingRectangle& getBounds() const  { return _bounds; }

        float getAngleWithGround() { return _angleWithGround; }
        void setAngleWithGround(float val) { _angleWithGround = val; }

    private:
        BehaviorPtr _behavior;
        ScopedPtr<Appearance> _appearance;

        Vec2f _pos;
        Vec2f _vel;
        BoundingRectangle _bounds;
        Zeroed<float> _angleWithGround;
    };
    typedef RefPtr<Entity> EntityPtr;

}


#endif
