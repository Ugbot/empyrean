#ifndef PYR_DIE_H
#define PYR_DIE_H

#include "Singleton.h"

namespace pyr {

    class Die {
        PYR_DECLARE_SINGLETON(Die);

    public:
        int roll(int low, int high);

    private:
        Die();
        ~Die() {};

        //seed for random number generator
        void seedMT(long seed);

        //random integer
        unsigned long lrandMT(void);

        //random double
        double drandMT(void);

        unsigned long reloadMT(void);
    };

}

#endif
