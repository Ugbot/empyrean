#ifndef PYR_BEHAVIOR_H
#define PYR_BEHAVIOR_H


#include <map>
#include <string>
#include <vector>
#include "LokiTypeInfo.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Utility.h"
#include "VecMath.h"

namespace pyr {

    class Appearance;
    class Entity;
    class Map;

#define PYR_BEHAVIOR_NAME(name)             \
    std::string getName() {                 \
        return getClassName();              \
    }                                       \
    static const char* getClassName() {     \
        return (name);                      \
    }


    /**
     * Represents the read-only surroundings of an entity, passed into
     * Behavior's update() so it can use information from the map and
     * nearby entities.
     */
    struct Environment {
        const Map* map;
        std::vector<const Entity*> entities;
    };

    
    /**
     * A chunk of "behavior" that can be added.  For example, Physics.
     * This data is not synchronized.  It is currently hoped that we can
     * get away with expecting the same Behavior commands and processing
     * on both the client and the server.  It may be the case that it will
     * have to be sent along with entity update information.
     */
    class BehaviorSlot {
    public:
        virtual ~BehaviorSlot() { }
    };


    /**
     * Responsible for controlling an entity's motion and actions.
     */
    class Behavior : public RefCounted {
    protected:
        virtual ~Behavior();

    public:
        virtual std::string getName() = 0;
        virtual std::string getResource() = 0;
        virtual void update(Entity* entity, float dt, const Environment& env) = 0;

        template<typename SlotT>
        SlotT* getSlot(Type2Type<SlotT> = Type2Type<SlotT>()) const {
            SlotMap::const_iterator i = _slots.find(typeid(SlotT));
            return (i == _slots.end() ? 0 : checked_cast<SlotT*>(i->second));
        }

    protected:
        void sendAppearanceCommand(Entity* entity, const std::string& command);
        void beginAnimationCycle(Entity* entity, const std::string& animation);
        void beginAnimation(Entity* entity, const std::string& animation);

        /**
         * Adds a slot, indexed by its type, to the slots map.  There can be
         * only one slot of each type in the map.  This is intended to be
         * called from the behavior's constructor.  We haven't worked out
         * what happens if you call it after the entity has been in use for
         * a while.
         */
        void setSlot(BehaviorSlot* slot) {
            if (slot) {
                delete _slots[typeid(*slot)];
                _slots[typeid(*slot)] = slot;
            }
        }

    private:
        static Appearance* getAppearance(Entity* entity);

        typedef std::map<TypeInfo, BehaviorSlot*> SlotMap;
        SlotMap _slots;
    };
    typedef RefPtr<Behavior> BehaviorPtr;

    /**
     * Instantiates a behavior from the type 'name'.  Returns a default (naive)
     * implementation of a behavior if the name isn't understood.
     *
     * This function will not return a null pointer.
     */
    BehaviorPtr instantiateBehavior(const std::string& name,
                                    const std::string& resource = "");
}

#endif
