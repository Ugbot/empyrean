#ifndef PYR_CLIENT_ENTITY_H
#define PYR_CLIENT_ENTITY_H

#include "ClientAppearance.h"
#include "Entity.h"
#include "Utility.h"

namespace pyr {

    class ClientEntity : public Entity {
    public:
        ClientEntity(Behavior* behavior, ClientAppearance* appearance)
            : Entity(behavior, appearance)
        {
        }

        /// Override update() so we can update the appearance.
        void update(float dt, const Map* map);
        void draw() const;

        void getVitalityUpdate(int& current, int& max);
        void getEtherUpdate(int& current, int& max);

        // Accessors
        void setCurrentVitality(int val) {_currentVitality = val;} 
        void setMaxVitality(int val) {_maxVitality = val;}
        void setCurrentEther(int val) {_currentEther = val;}
        void setMaxEther(int val) {_maxEther = val;}

    private:
        Zeroed<int> _maxVitality;
        Zeroed<int> _currentVitality;
        Zeroed<int> _maxEther;
        Zeroed<int> _currentEther;

        /// We specified the appearance, so we know what type it is.
        ClientAppearance* getClientAppearance() const {
            return static_cast<ClientAppearance*>(getAppearance());
        }
    };

}

#endif
