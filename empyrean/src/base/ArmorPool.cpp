#include "ArmorPool.h"

namespace pyr {
    
#define ADD_FIRST_ARMOR(name,def,dmgDiv,file)   \
    Armor arm;                                  \
    ADD_ARMOR(name,def,dmgDiv,file)

#define ADD_ARMOR(name,def,dmgDiv,file)  \
    arm._name = name;                    \
    arm._defense = def;                  \
    arm._damageDiv = dmgDiv;             \
    arm._modelName = file;               \
    _armors[name] = arm;   

    void Armor::copy(Armor& a) {
        _name = a._name;
        _modelName = a._modelName;   
        _defense = a._defense;
        _damageDiv = a._damageDiv;
    }

    PYR_DEFINE_SINGLETON(ArmorPool)

    Armor* ArmorPool::getArmor(std::string name) {
        Armor* choice = 0;
        std::map<std::string,Armor>::iterator it = _armors.find(name);
        if (it != _armors.end()) {
            choice = new Armor();
            choice->copy(it->second);
        }
        return choice;
    }

    void ArmorPool::switchArmor(Armor* armor, std::string name) {
        std::map<std::string,Armor>::iterator it = _armors.find(name);
        if (it != _armors.end()) {
            armor->copy(it->second);
        }
    }

    std::string ArmorPool::getAllArmorNames() {
        std::string out;
        for(std::map<std::string,Armor>::iterator it = _armors.begin(); it!=_armors.end(); ++it) {
            out += it->first + ",";
        }
        return out;
    }

    ArmorPool::ArmorPool() {
        // Create the armor list
        _armors.clear();

        ADD_FIRST_ARMOR("Leather",2,1,"Leather.flt")
        ADD_ARMOR("Chain Shirt",4,1,"ChainShirt.flt")
        ADD_ARMOR("Scale Mail",6,1,"ScaleMail.flt")
        ADD_ARMOR("Chain Mail",8,1,"ChainMail.flt")
        ADD_ARMOR("Full Plate",10,2,"FullPlate.flt")
     }
}