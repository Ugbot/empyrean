#include "WeaponPool.h"

namespace pyr {

#define ADD_FIRST_WEAPON(name,minDmg,maxDmg,dmgMult,acc,file)   \
    Weapon wpn;                                                 \
    ADD_WEAPON(name,minDmg,maxDmg,dmgMult,acc,file)

#define ADD_WEAPON(name,minDmg,maxDmg,dmgMult,acc,file) \
    wpn._name = name;                                   \
    wpn._damageMin = minDmg;                            \
    wpn._damageMax = maxDmg;                            \
    wpn._damageMult = dmgMult;                          \
    wpn._accuracy = acc;                                \
    wpn._modelName = file;                              \
    _weapons[name] = wpn;                

    void Weapon::copy(Weapon& w) {
        _name = w._name;
        _modelName = w._modelName;
        _damageMin = w._damageMin;
        _damageMax = w._damageMax;
        _damageMult = w._damageMult;
        _accuracy = w._accuracy;
    }

    PYR_DEFINE_SINGLETON(WeaponPool)

    Weapon* WeaponPool::getWeapon(std::string name) {
        Weapon* choice = 0;
        std::map<std::string,Weapon>::iterator it = _weapons.find(name);
        if (it != _weapons.end()) {
            choice = new Weapon();
            choice->copy(it->second);
        }
        return choice;
    }

    void WeaponPool::switchWeapon(Weapon* weapon, std::string name) {
        std::map<std::string,Weapon>::iterator it = _weapons.find(name);
        if (it != _weapons.end()) {
            weapon->copy(it->second);
        }
    }

    std::string WeaponPool::getAllWeaponNames() {
        std::string out;
        for(std::map<std::string,Weapon>::iterator it = _weapons.begin(); it!=_weapons.end(); ++it) {
            out += it->first + ",";
        }
        return out;
    }

    WeaponPool::WeaponPool() {
        // Create the weapon list
        _weapons.clear();

        ADD_FIRST_WEAPON("Dagger",1,3,1,2,"Dagger.flt")
        ADD_WEAPON("Short Sword",1,6,1,4,"ShortSword.flt")
        ADD_WEAPON("Long Sword",2,9,1,5,"LongSword.flt")
        ADD_WEAPON("Pistol",1,8,1,3,"Pistol.flt")

        // Add weapons to the pool as needed        
    }

}
