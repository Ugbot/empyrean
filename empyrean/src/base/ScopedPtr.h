#ifndef PYR_SCOPED_PTR_H
#define PYR_SCOPED_PTR_H


#include "Debug.h"


namespace pyr {

    /**
     * This smart pointer is roughly analogous to boost's scoped_ptr
     * and std::auto_ptr.  It has destructive copy, and thus, is not
     * container-safe.
     */    
    template<typename T>
    class ScopedPtr {
    public:
        ScopedPtr(T* p = 0) {
            _ptr = p;
        }
        
        ~ScopedPtr() {
            delete _ptr;
        }
        
        T* get() const {
            return _ptr;
        }
        
        T* operator->() const {
            PYR_ASSERT(get() != 0, "Can't dereference null pointer");
            return get();
        }
    
        T& operator*() {
            PYR_ASSERT(get() != 0, "Can't dereference null pointer");
            return *get();
        }
        
        operator bool() const {
            return (_ptr != 0);
        }
        
        ScopedPtr<T>& operator=(ScopedPtr<T>& p) {
            if (_ptr != p._ptr) {
                delete _ptr;
                _ptr = p._ptr;
                p._ptr = 0;
            }
            return *this;
        }
        
        ScopedPtr<T>& operator=(T* p) {
            if (_ptr != p) {
                delete _ptr;
                _ptr = p;
            }
            return *this;
        }
        
    private:
        T* _ptr;
    };


    template<typename T, typename U>
    bool operator==(const ScopedPtr<T>& a, const ScopedPtr<U>& b) {
        return (a.get() == b.get());
    }

    template<typename T>
    bool operator==(const ScopedPtr<T>& a, const T* b) {
        return (a.get() == b);
    }

    template<typename T>
    bool operator==(const T* a, const ScopedPtr<T>& b) {
        return (a == b.get());
    }
    

    template<typename T, typename U>
    bool operator!=(const ScopedPtr<T>& a, const ScopedPtr<U>& b) {
        return (a.get() != b.get());
    }

    template<typename T>
    bool operator!=(const ScopedPtr<T>& a, const T* b) {
        return (a.get() != b);
    }

    template<typename T>
    bool operator!=(const T* a, const ScopedPtr<T>& b) {
        return (a != b.get());
    }
    
}


#endif
