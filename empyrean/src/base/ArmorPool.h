#ifndef ARMOR_POOL_H
#define ARMOR_POOL_H

#include <map>
#include "RefCounted.h"
#include "RefPtr.h"
#include "Singleton.h"

namespace pyr {

    class Armor : public RefCounted {
    protected:
        ~Armor() { }

    public:
        Armor() {
        }

        Armor(const Armor& rhs) {
            *this = rhs;
        }

        Armor& operator=(const Armor& rhs) {
            // Can't call RefCounted::operator= because it's private.
            _name      = rhs._name;
            _modelName = rhs._modelName;
            _defense   = rhs._defense;
            _damageDiv = rhs._damageDiv;
            return *this;
        }

        std::string _name;
        std::string _modelName;
        Zeroed<int> _defense;
        Zeroed<int> _damageDiv;
    };
    typedef RefPtr<Armor> ArmorPtr;

    class ArmorPool {
        PYR_DECLARE_SINGLETON(ArmorPool);

        ArmorPool();

    public:
        ArmorPtr getArmor(std::string name);
        void switchArmor(ArmorPtr armor, std::string name);
        std::string getAllArmorNames();

    private:
        void addArmor(const char* name, int defense, int dmgDiv, const char* file);

        typedef std::map<std::string, ArmorPtr> ArmorMap;
        ArmorMap _armors;
    };
}

#endif
