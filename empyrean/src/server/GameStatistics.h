#ifndef PYR_GAME_STATISTICS_H
#define PYR_GAME_STATISTICS_H

#include <string>
#include "ArmorPool.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Utility.h"
#include "WeaponPool.h"

namespace pyr {

    class StatisticsModifier;

    class GameStatistics : public RefCounted {
    protected:
        GameStatistics() { }
        ~GameStatistics() { }

    public:
        virtual void load(FILE* file = 0);
        void loadTestCharacter();
        void loadTestMonster();
        virtual void save(FILE* file) const;

        // State Changers
        void changeVitality(int change);
        void changeEther(int change);

        // State Accessors
        int getMaxVitality()        { return _maxVitality; }
        int getCurrentVitality()    { return _currVitality; }
        int getMaxEther()           { return _maxEther; }
        int getCurrentEther()       { return _currEther; }

        // Stat Accessors
        int getStrength()         { return round(_strength); }
        int getAgility()          { return round(_agility); }
        int getEndurance()        { return round(_endurance); }
        int getCharisma()         { return round(_charisma); }
        int getIntelligence()     { return round(_intelligence); }
        int getResolve()          { return round(_resolve); }

        // Skill Accessors
        int getJumpAttackSkill()  { return round(_jumpAttackSkill); }
        int getSniperSkill()      { return round(_sniperSkill); }
        int getRushSkill()        { return round(_rushSkill); }
        int getDodgeSkill()       { return round(_dodgeSkill); }
        int getSlideAttackSkill() { return round(_slideAttackSkill); }
        int getBlockSkill()       { return round(_blockSkill); }

        // Weapon Accessors
        std::string getEquippedWeaponName();
        std::string getWeaponName(int index);
        int getNumWeapons() { return _weapons.size(); } 
        void getEquippedWeaponStats(int& minDmg, int& maxDmg, int& dmgMult, int& acc);
        void getWeaponStats(int index, int& minDmg, int& maxDmg, int& dmgMult, int& acc);
        void equipWeapon(std::string name);
        
        // Armor Accessors
        std::string getEquippedArmorName();
        std::string getArmorName(int index);
        int getNumArmors() { return _armors.size(); }
        void getEquippedArmorStats(int& def, int& dmgDiv);
        void getArmorStats(int index, int& def, int& dmgDiv);
        void equipArmor(std::string name);

    private:
        friend class StatisticsModifier;
        
        // State
        Zeroed<int> _maxVitality;
        Zeroed<int> _currVitality;
        Zeroed<int> _maxEther;
        Zeroed<int> _currEther;

        // Stats
        Zeroed<float> _strength;
        Zeroed<float> _agility;
        Zeroed<float> _endurance;
        Zeroed<float> _charisma;
        Zeroed<float> _intelligence;
        Zeroed<float> _resolve;

        // Skills
        Zeroed<float> _jumpAttackSkill;
        Zeroed<float> _sniperSkill;
        Zeroed<float> _rushSkill;
        Zeroed<float> _dodgeSkill;
        Zeroed<float> _slideAttackSkill;
        Zeroed<float> _blockSkill;

        // Equipment
        std::vector<WeaponPtr> _weapons;
        Zeroed<int> _equippedWeapon;
        std::vector<ArmorPtr> _armors;
        Zeroed<int> _equippedArmor;
        //vector<Item*> _items;
        //vector<Accessories*> _accessories;
    };
    PYR_REF_PTR(GameStatistics);

}


#endif
