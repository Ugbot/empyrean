#ifndef PYR_MONSTER_H
#define PYR_MONSTER_H

#include "GameStatistics.h"

namespace pyr {

    class Monster : public GameStatistics {
    protected:
        ~Monster() { }

    public:
        Monster() { load(); }
    
        void load(FILE* file = 0);
        void save(FILE* file) const;

    private:
        // Nothing yet...
    };
    PYR_REF_PTR(Monster);

}


#endif
