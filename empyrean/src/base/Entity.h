#ifndef PYR_ENTITY_H
#define PYR_ENTITY_H


#include <list>
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
        Entity(BehaviorPtr behavior, AppearancePtr appearance) {
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

        BehaviorPtr   getBehavior()   const { return _behavior;   }
        AppearancePtr getAppearance() const { return _appearance; }

        void setPos(const Vec2f& pos) { _pos = pos;  }
        Vec2f& getPos()               { return _pos; }
        const Vec2f& getPos() const   { return _pos; }

        void setVel(const Vec2f& vel) { _vel = vel;  }
        Vec2f& getVel()               { return _vel; }
        const Vec2f& getVel() const   { return _vel; }

        void setNextPos(const Vec2f& pos) { _nextPos = pos;  }
        const Vec2f& getNextPos() const   { return _nextPos; }
        void setNextVel(const Vec2f& vel) { _nextVel = vel;  }
        const Vec2f& getNextVel() const   { return _nextVel; }
        void setNextWithCurrent();
        void setCurrentWithNext();

        void setBounds(const BoundingRectangle& br) { _bounds = br; }
        BoundingRectangle& getBounds()              { return _bounds; }
        const BoundingRectangle& getBounds() const  { return _bounds; }

        // For convenience.
        void sendAppearanceCommand(const string& command);
        void beginAnimationCycle(const string& animation);
        void beginAnimation(const string& animation);

    private:
        BehaviorPtr _behavior;
        AppearancePtr _appearance;

        Vec2f _nextPos;
        Vec2f _nextVel;
        Vec2f _pos;
        Vec2f _vel;
        BoundingRectangle _bounds;
    };
    PYR_REF_PTR(Entity);

}


#endif
