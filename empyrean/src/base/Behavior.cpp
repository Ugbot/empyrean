#include "Behavior.h"
#include "Entity.h"
#include "MonsterBehavior.h"
#include "PlayerBehavior.h"
#include "PythonBehavior.h"
#include "Utility.h"
#include "VecMath.h"


namespace pyr {

    Behavior::~Behavior() {
        for (SlotMap::iterator i = _slots.begin(); i != _slots.end(); ++i) {
            delete i->second;
        }
        _slots.clear();
    }

    void Behavior::sendAppearanceCommand(Entity* entity,
                                         const std::string& command) {
        getAppearance(entity)->sendCommand(command);
    }

    void Behavior::beginAnimationCycle(Entity* entity,
                                       const std::string& animation) {
        getAppearance(entity)->beginAnimationCycle(animation);
    }

    void Behavior::beginAnimation(Entity* entity, const std::string& animation) {
        getAppearance(entity)->beginAnimation(animation);
    }

    Appearance* Behavior::getAppearance(Entity* entity) {
        PYR_ASSERT(entity, "Can't get appearance without an entity");
        Appearance* appearance = entity->getAppearance();
        PYR_ASSERT(appearance, "Entity must have an appearance");
        return appearance;
    }


    /// Placeholder entity behavior class, for testing only.
    class DumbBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("dumb");
        
        DumbBehavior(const std::string& /*resource*/) {
        }

        void update(Entity* entity, float dt, const Environment& /*env*/) {
            entity->getPos() += entity->getVel() * dt;

            entity->getVel()[0] += sin(angle) * dt / 2;
            entity->getVel()[1] += cos(angle) * dt / 2;
            angle += PI * dt / 2;
        }

        std::string getResource() {
            return "";
        }

    private:
        Zeroed<float> angle;
    };


    class NullBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("null");

        NullBehavior(const std::string& /*resource*/) {
        }

        void update(Entity* entity, float dt, const Environment& /*env*/) {
            entity->getPos() += entity->getVel() * dt;
        }

        std::string getResource() {
            return "";
        }
    };


    BehaviorPtr instantiateBehavior(const std::string& name,
                                    const std::string& resource) {
#define TRY_TYPE(type)                          \
        if (name == type::getClassName()) {     \
            return new type(resource);          \
        }

        TRY_TYPE(DumbBehavior);
        TRY_TYPE(NullBehavior);
        TRY_TYPE(PlayerBehavior);
        TRY_TYPE(PythonBehavior);
        TRY_TYPE(MonsterBehavior);
        return new NullBehavior(resource);
    }

}
