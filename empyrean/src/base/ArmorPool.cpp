#include "ArmorPool.h"

namespace pyr {

    PYR_DEFINE_SINGLETON(ArmorPool)

    ArmorPool::ArmorPool() {
        addArmor("Leather",2,1,"Leather.flt");
        addArmor("Chain Shirt",4,1,"ChainShirt.flt");
        addArmor("Scale Mail",6,1,"ScaleMail.flt");
        addArmor("Chain Mail",8,1,"ChainMail.flt");
        addArmor("Full Plate",10,2,"FullPlate.flt");
        addArmor("Scales",3,1,"PartOfMonster");
    }

    ArmorPtr ArmorPool::getArmor(std::string name) {
        ArmorPtr choice = _armors[name];
        return (choice ? new Armor(*choice) : 0);
    }

    void ArmorPool::switchArmor(ArmorPtr armor, std::string name) {
        ArmorMap::iterator it = _armors.find(name);
        if (it != _armors.end()) {
            *armor = *(it->second);
        }
    }

    std::string ArmorPool::getAllArmorNames() {
        std::string out;
        for(ArmorMap::iterator it = _armors.begin(); it!=_armors.end(); ++it) {
            out += it->first + ",";
        }
        return out;
    }

    void ArmorPool::addArmor(const char* name, int defense, int dmgDiv, const char* file) {
        ArmorPtr armor = new Armor;
        armor->_name      = name;
        armor->_defense   = defense;
        armor->_damageDiv = dmgDiv;
        armor->_modelName = file;
        _armors[name] = armor;
    }
}
