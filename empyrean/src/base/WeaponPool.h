#ifndef WEAPON_POOL_H
#define WEAPON_POOL_H

#include <map>
#include "RefCounted.h"
#include "RefPtr.h"
#include "Singleton.h"

namespace pyr {

    class Weapon : public RefCounted {
    protected:
        ~Weapon() { }
    public:
        Weapon() {
        }

        Weapon(const Weapon& rhs) {
            *this = rhs;
        }

        Weapon& operator=(const Weapon& rhs) {
            // Can't call RefCounted::operator= because it's private.
            _name       = rhs._name;
            _modelName  = rhs._modelName;
            _damageMin  = rhs._damageMin;
            _damageMax  = rhs._damageMax;
            _damageMult = rhs._damageMult;
            _accuracy   = rhs._accuracy;
            return *this;
        }

        std::string _name;
        std::string _modelName;
        Zeroed<int> _damageMin;
        Zeroed<int> _damageMax;
        Zeroed<int> _damageMult;
        Zeroed<int> _accuracy;
    };
    PYR_REF_PTR(Weapon);

    class WeaponPool {
        PYR_DECLARE_SINGLETON(WeaponPool);

        WeaponPool();

    public:
        WeaponPtr getWeapon(std::string name);
        void switchWeapon(WeaponPtr weapon, std::string name);
        std::string getAllWeaponNames();

    private:
        void addWeapon(const char* name, int minDmg, int maxDmg, int dmgMult, int acc, const char* file);

        typedef std::map<std::string, WeaponPtr> WeaponMap;
        WeaponMap _weapons;
    };

}

#endif
