#include "WeaponPool.h"

namespace pyr {

    PYR_DEFINE_SINGLETON(WeaponPool)

    WeaponPool::WeaponPool() {
        addWeapon("Dagger",1,3,1,2,"Dagger.flt");
        addWeapon("Short Sword",1,6,1,4,"ShortSword.flt");
        addWeapon("Long Sword",2,9,1,5,"LongSword.flt");
        addWeapon("Pistol",1,8,1,3,"Pistol.flt");
        addWeapon("SmallClaws",1,5,1,3,"PartOfMonster");

        // Add weapons to the pool as needed
    }

    WeaponPtr WeaponPool::getWeapon(std::string name) {
        WeaponPtr choice = _weapons[name];
        return (choice ? new Weapon(*choice) : 0);
    }

    void WeaponPool::switchWeapon(WeaponPtr weapon, std::string name) {
        WeaponMap::iterator it = _weapons.find(name);
        if (it != _weapons.end()) {
            *weapon = *(it->second);
        }
    }

    std::string WeaponPool::getAllWeaponNames() {
        std::string out;
        for(WeaponMap::iterator it = _weapons.begin(); it!=_weapons.end(); ++it) {
            out += it->first + ",";
        }
        return out;
    }

    void WeaponPool::addWeapon(const char* name, int minDmg, int maxDmg, int dmgMult, int acc, const char* file) {
        WeaponPtr wpn = new Weapon;
        wpn->_name       = name;
        wpn->_damageMin  = minDmg;
        wpn->_damageMax  = maxDmg;
        wpn->_damageMult = dmgMult;
        wpn->_accuracy   = acc;
        wpn->_modelName  = file;
        _weapons[name] = wpn;
    }


}
