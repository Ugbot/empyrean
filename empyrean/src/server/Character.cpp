#include "Character.h"

namespace pyr {

    void Character::load(FILE* file) {
        // Generate the test character if asked to
        if (!file) {
            loadTestCharacter();            
        }
        else {
            GameStatistics::load(file);
        }
    }

    void Character::save(FILE* file) const {
        GameStatistics::save(file);
    }
}
