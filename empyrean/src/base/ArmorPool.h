#ifndef ARMOR_POOL_H
#define ARMOR_POOL_H

#include <map>
#include "Singleton.h"

namespace pyr {

    class Armor {
    public:
        Armor() {}
        ~Armor() {}

        void copy(Armor& a);
        void copy(Armor* a) { copy(*a); }

        std::string _name;
        std::string _modelName;
        Zeroed<int> _defense;
        Zeroed<int> _damageDiv;
    };

    class ArmorPool {
        PYR_DECLARE_SINGLETON(ArmorPool);
    
    public:
        Armor* getArmor(std::string name);
        void switchArmor(Armor* armor, std::string name);
        std::string getAllArmorNames();
        
    private:
        ArmorPool();
        ~ArmorPool() {};

        std::map<std::string,Armor> _armors;
    };
}

#endif