#ifndef PYR_CHARACTER_H
#define PYR_CHARACTER_H


#include <string>
#include "RefCounted.h"
#include "RefPtr.h"


namespace pyr {

    class Character : public RefCounted {
    protected:
        ~Character() { }

    public:
        Character() {
        }
    
        void save(FILE* file) const;

    private:
        // I suppose weapons and armor and stats go here?
    };
    typedef RefPtr<Character> CharacterPtr;
    
}


#endif
