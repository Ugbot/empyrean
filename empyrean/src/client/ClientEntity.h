#ifndef PYR_CLIENT_ENTITY_H
#define PYR_CLIENT_ENTITY_H

#include "ClientAppearance.h"
#include "Entity.h"
#include "Utility.h"
#include <gltext.h>

namespace pyr {

    class ClientEntity : public Entity {
    public:
        ClientEntity(Behavior* behavior, ClientAppearance* appearance)
            : Entity(behavior, appearance)
        {
        }

        /// Override update() so we can update the appearance.
        void update(float dt, const Environment& env);
        void draw(gltext::FontRendererPtr rend) const;

        void getVitalityUpdate(int& current, int& max);
        void getEtherUpdate(int& current, int& max);

        // Accessors
        void setCurrentVitality(int val);  
        void setMaxVitality(int val) {_maxVitality = val;}
        void setCurrentEther(int val);
        void setMaxEther(int val) {_maxEther = val;}

    private:
        Zeroed<int> _maxVitality;
        Zeroed<int> _currentVitality;
        Zeroed<int> _vitalityChange;
        Zeroed<float> _timeToShowVitChange;
        Inited<bool,true> _vitalityFirstTime;
        Zeroed<int> _maxEther;
        Zeroed<int> _currentEther;
        Zeroed<int> _etherChange;
        Zeroed<float> _timeToShowEthChange;
        Inited<bool,true> _etherFirstTime;

        /// We specified the appearance, so we know what type it is.
        ClientAppearance* getClientAppearance() const {
            return static_cast<ClientAppearance*>(getAppearance());
        }
    };

}

#endif
