#ifndef PYR_SCOPED_ARRAY_H
#define PYR_SCOPED_ARRAY_H


#include "Debug.h"


namespace pyr {

    /**
     * This smart pointer is roughly analogous to boost's scoped_array.
     */
    template<typename T>
    class ScopedArray {
    public:
        ScopedArray(T* p = 0) {
            _array = p;
        };
        
        ~ScopedArray() {
            delete[] _array;
        }
        
        T* get() const {
            return _array;
        }

        const T& operator [](unsigned int idx) const {
            PYR_ASSERT(get() != 0, "Can't index null array");
            return get()[idx];
        }

        T& operator [](unsigned int idx) {
            PYR_ASSERT(get() != 0, "Can't index null array");
            return get()[idx];
        }
    
    private:
        T* _array;
    };

}


#endif
