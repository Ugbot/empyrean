#ifndef PYR_PLAYER_H
#define PYR_PLAYER_H

#include "ArmorPool.h"
#include "ScopedPtr.h"
#include "WeaponPool.h"

namespace pyr {

    class Player {
    public:
        Player();
        void getVitalityUpdate(int& current, int& max);
        void getEtherUpdate(int& current, int& max);

        // Accessors
        void setCurrentVitality(int val) {_currentVitality = val;} 
        void setMaxVitality(int val) {_maxVitality = val;}
        void setCurrentEther(int val) {_currentEther = val;}
        void setMaxEther(int val) {_maxEther = val;}

    private:
        int _maxVitality;
        int _currentVitality;
        int _maxEther;
        int _currentEther;
    };

}

#endif
