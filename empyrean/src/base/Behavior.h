#ifndef PYR_BEHAVIOR_H
#define PYR_BEHAVIOR_H


#include <queue>
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
    class Environment;

#define PYR_BEHAVIOR_NAME(name)             \
    std::string getName() {                 \
        return getClassName();              \
    }                                       \
    static const char* getClassName() {     \
        return (name);                      \
    }


    /**
     * A chunk of "behavior" that can be added.  For example, Physics.
     * This data is not synchronized.  It is currently hoped that we can
     * get away with expecting the same Behavior commands and processing
     * on both the client and the server.  It may be the case that it will
     * have to be sent along with entity update information.
     */
    class BehaviorSlot : public RefCounted {
    protected:
        virtual ~BehaviorSlot() { }
    };
    PYR_REF_PTR(BehaviorSlot);


    struct Action : public RefCounted {
    protected:
        virtual ~Action() { }

        // This is always an attack action.
    };
    PYR_REF_PTR(Action);

    typedef std::queue<ActionPtr> ActionQueue;


    /**
     * Responsible for controlling an entity's motion and actions.
     */
    class Behavior : public RefCounted {
    protected:
        virtual ~Behavior() { }

    public:
        virtual string getName() = 0;
        virtual string getResource() = 0;
        virtual void update(Entity* entity, float dt, const Environment& env) = 0;

        template<typename SlotT>
        SlotT* getSlot() const {
            SlotMap::const_iterator i = _slots.find(typeid(SlotT));
            return (i == _slots.end() ? 0 : checked_cast<SlotT*>(i->second.get()));
        }

        /**
         * Adds a slot, indexed by its type, to the slots map.  There can be
         * only one slot of each type in the map.  This is intended to be
         * called from the behavior's constructor.  We haven't worked out
         * what happens if you call it after the entity has been in use for
         * a while.
         */
        void setSlot(BehaviorSlot* slot) {
            if (slot) {
                _slots[typeid(*slot)] = slot;
            }
        }

        void addAction(ActionPtr action) {
            _actions.push(action);
        }
        
        void getActions(ActionQueue& actions) {
            actions = _actions;
            // queue has no clear()!
            while (!_actions.empty()) {
                _actions.pop();
            }
        }

    protected:
        void sendAppearanceCommand(Entity* entity, const std::string& command);
        void beginAnimationCycle(Entity* entity, const std::string& animation);
        void beginAnimation(Entity* entity, const std::string& animation);

        void copySlots(const Behavior* other) {
            _slots = other->_slots;
        }

    private:
        static Appearance* getAppearance(Entity* entity);

        typedef std::map<TypeInfo, BehaviorSlotPtr> SlotMap;

        SlotMap _slots;
        ActionQueue _actions;
    };
    PYR_REF_PTR(Behavior);

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
