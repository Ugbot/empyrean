#include "GameStatistics.h"
#include "ArmorPool.h"
#include "WeaponPool.h"

namespace pyr {

    void GameStatistics::load(FILE* file) {
    }

    void GameStatistics::loadTestMonster() {
        _currEther = 0; 
        _maxEther = 0;
        _currVitality = 50; 
        _maxVitality = 50; 
        ArmorPtr armor = the<ArmorPool>().getArmor("Scales");
        _armors.push_back(armor);
        WeaponPtr weapon = the<WeaponPool>().getWeapon("SmallClaws");
        _weapons.push_back(weapon);
    }

    void GameStatistics::loadTestCharacter() {
        _currEther = 50;
        _maxEther = 50;
        _currVitality = 100;
        _maxVitality = 100;
        ArmorPtr armor = the<ArmorPool>().getArmor("Leather");
        _armors.push_back(armor);
        WeaponPtr weapon = the<WeaponPool>().getWeapon("Short Sword");
        _weapons.push_back(weapon);
        weapon = the<WeaponPool>().getWeapon("Pistol");
        _weapons.push_back(weapon);
    }

    void GameStatistics::save(FILE* file) const {
    }

    // State Changers
    void GameStatistics::changeVitality(int change) {
        _currVitality += change;
        if (_currVitality > _maxVitality) {
            _currVitality = _maxVitality;
        }
        else if (_currVitality < 0) {
            _currVitality = 0;
        }
    }

    void GameStatistics::changeEther(int change) {
        _currEther += change;
        if (_currEther > _maxEther) {
            _currEther = _maxEther;
        }
        else if (_currEther < 0) {
            _currEther = 0;
        }
    }

    // Weapon Accessors
    std::string GameStatistics::getEquippedWeaponName() {
        return _weapons[_equippedWeapon]->_name;
    }

    std::string GameStatistics::getWeaponName(int index) {
        PYR_ASSERT(index > -1 && index < (int)_weapons.size(),"Bad Index in getWeaponName");
        return _weapons[index]->_name;
    }

    void GameStatistics::getEquippedWeaponStats(int& minDmg, int& maxDmg, int& dmgMult, int& acc) {
        getWeaponStats(_equippedWeapon,minDmg,maxDmg,dmgMult,acc);
    }

    void GameStatistics::getWeaponStats(int index, int& minDmg, int& maxDmg, int& dmgMult, int& acc) {
        minDmg = _weapons[index]->_damageMin;
        maxDmg = _weapons[index]->_damageMax;
        dmgMult = _weapons[index]->_damageMult;
        acc = _weapons[index]->_accuracy;
    }

    void GameStatistics::equipWeapon(std::string name) {
        for (int i=0; i<(int)_weapons.size(); i++) {
            if (_weapons[i]->_name == name) {
                _equippedWeapon = i;
            }
        }
    }
    
    // Armor Accessors
    std::string GameStatistics::getEquippedArmorName(){
        return _armors[_equippedArmor]->_name;
    }

    std::string GameStatistics::getArmorName(int index){
        PYR_ASSERT(index > -1 && index < (int)_armors.size(),"Bad Index in getArmorName");
        return _armors[index]->_name;
    }

    void GameStatistics::getEquippedArmorStats(int& def, int& dmgDiv) {
        getArmorStats(_equippedArmor,def,dmgDiv);
    }

    void GameStatistics::getArmorStats(int index, int& def, int& dmgDiv) {
        def = _armors[index]->_defense;
        dmgDiv = _armors[index]->_damageDiv;
    }

    void GameStatistics::equipArmor(std::string name){
        for (int i=0; i<(int)_armors.size(); i++) {
            if (_armors[i]->_name == name) {
                _equippedArmor = i;
            }
        }
    }
    
}
