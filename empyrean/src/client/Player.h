#ifndef PYR_PLAYER_H
#define PYR_PLAYER_H

#include "ScopedPtr.h"

namespace pyr {

    class Weapon;
    class Armor;

    class Player {
    public:
        Player();
        void getVitalityUpdate(int& current, int& max);
        void getEtherUpdate(int& current, int& max);
        void decrVitality(int decr);
        void incrVitality(int incr);
        void decrEther(int decr);
        void incrEther(int incr);

    private:
        int _maxVitality;
        int _currentVitality;
        int _maxEther;
        int _currentEther;

        ScopedPtr<Weapon> _meleeWeapon;
        ScopedPtr<Weapon> _rangeWeapon;
        ScopedPtr<Armor>  _armor;
    };

}

#endif
