#include "Monster.h"

namespace pyr {

    void Monster::load(FILE* file) {
         // Generate the test monster if asked to
        if (!file) {
            loadTestMonster();
        }
        else {
            GameStatistics::load(file);
            }
    }

    void Monster::save(FILE* file) const {
        GameStatistics::save(file);
    }
}
