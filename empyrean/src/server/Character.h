#ifndef PYR_CHARACTER_H
#define PYR_CHARACTER_H


#include <string>
#include "RefCounted.h"
#include "RefPtr.h"
#include "Utility.h"
#include "ScopedPtr.h"

namespace pyr {

   class Weapon;
   class Armor;
   class CharacterModifier;

    class Character : public RefCounted {
    protected:
        ~Character() { }

    public:
        Character() { load(); }
    
        void load(FILE* file = 0);
        void save(FILE* file) const;

        // State Changers
        void changeVitality(int change);
        void changeEther(int change);

        // State Accessors
        int getMaxVitality()        { return _maxVitality; }
        int getCurrentVitality()    { return _currVitality; }
        int getMaxEther()           { return _maxEther; }
        int getCurrentEther()       { return _currEther; }

        // Advancement Accessors
        int getExperience()         { return _experience; }
        int getLevel()              { return _level; }

        // Stat Accessors
        float getStrength()         { return _strength; }
        float getAgility()          { return _agility; }
        float getEndurance()        { return _endurance; }
        float getCharisma()         { return _charisma; }
        float getIntelligence()     { return _intelligence; }
        float getResolve()          { return _resolve; }

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
        friend class CharacterModifier;
        //friend class ExperienceAwarder;
        
        // State
        Zeroed<int> _maxVitality;
        Zeroed<int> _currVitality;
        Zeroed<int> _maxEther;
        Zeroed<int> _currEther;
        
        // Advancement
        Zeroed<int> _experience;
        Inited<int,1> _level;

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
        std::vector<Weapon*> _weapons;
        Zeroed<int> _equippedWeapon;
        std::vector<Armor*> _armors;
        Zeroed<int> _equippedArmor;
        //vector<ScopedPtr<Item>> _items;
        //vector<ScopedPtr<Accessories>> _accessories;
    };
    typedef RefPtr<Character> CharacterPtr;

}


#endif
