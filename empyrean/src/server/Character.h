#ifndef PYR_CHARACTER_H
#define PYR_CHARACTER_H

#include "GameStatistics.h"

namespace pyr {

    class ExperienceAwarder;

    class Character : public GameStatistics {
    protected:
        ~Character() { }

    public:
        Character() { load(); }
    
        void load(FILE* file = 0);
        void save(FILE* file) const;

        // Advancement Accessors
        int getExperience()         { return _experience; }
        int getLevel()              { return _level; }

    private:
        friend class ExperienceAwarder;
        
        // Advancement
        Zeroed<int> _experience;
        Inited<int,1> _level;
    };
    typedef RefPtr<Character> CharacterPtr;

}


#endif
