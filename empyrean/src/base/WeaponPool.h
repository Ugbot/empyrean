#ifndef WEAPON_POOL_H
#define WEAPON_POOL_H

#include <map>
#include "Singleton.h"

namespace pyr {

    class Weapon {
    public:
        Weapon() {};
        ~Weapon() {};

        void copy(Weapon& w);
        void copy(Weapon* w) { copy(*w); }

        std::string _name;
        std::string _modelName;
        Zeroed<int> _damageMin;
        Zeroed<int> _damageMax;
        Zeroed<int> _damageMult;
        Zeroed<int> _accuracy;
    };

    class WeaponPool {
        PYR_DECLARE_SINGLETON(WeaponPool);

    public:
        Weapon* getWeapon(std::string name);
        void switchWeapon(Weapon* weapon, std::string name);
        std::string getAllWeaponNames();
        
    private:
        WeaponPool();
        ~WeaponPool() {};

        std::map<std::string,Weapon> _weapons;
    };

}

#endif
