#ifndef PYR_SCOPED_PTR_H
#define PYR_SCOPED_PTR_H


#include "Debug.h"


namespace pyr {

    /**
     * Don't use this type in your code.  It's there to prevent 'delete' from
     * being called on ScopedPtr objects.
     *
     * Note: This technique inspired by Mozilla's nsCOMPtr.
     */
    template<typename T>
    class ScopedDerivedSafe : public T {
    protected:
        ScopedDerivedSafe();

    private:
        ScopedDerivedSafe<T>& operator=(const T&);

        /// Prevents calling delete on a ScopedPtr.
        void operator delete(void*);
    };


    /**
     * This smart pointer is roughly analogous to boost's scoped_ptr
     * and std::auto_ptr.  It has destructive copy, and thus, is not
     * container-safe.
     */    
    template<typename T>
    class ScopedPtr {
    public:
        // For compatibility with Boost.Python.
        typedef T element_type;

        ScopedPtr(T* p = 0) {
            _ptr = p;
        }

        ScopedPtr(ScopedPtr<T>& p) {
            _ptr = p._ptr;
            p._ptr = 0;
        }

        ~ScopedPtr() {
            delete _ptr;
        }

        ScopedDerivedSafe<T>* get() const {
            return reinterpret_cast<ScopedDerivedSafe<T>*>(_ptr);
        }

        /**
         * Stupid hack so we can assign temporaries (using .ref()) to nonconst
         * references.
         */
        ScopedPtr<T>& ref() {
            return *this;
        }

        ScopedDerivedSafe<T>* operator->() const {
            PYR_ASSERT(get() != 0, "Null ScopedPtr dereferenced");
            return get();
        }

        T& operator*() {
            PYR_ASSERT(get() != 0, "Null ScopedPtr dereferenced");
            return *get();
        }

        operator ScopedDerivedSafe<T>*() const {
            return get();
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


    // For compatibility with Boost.Python.
    template<class T>
    T* get_pointer(const ScopedPtr<T>& p) {
        return p.get();
    }


    template<typename T, typename U>
    bool operator==(const ScopedPtr<T>& a, const ScopedPtr<U>& b) {
        return (a.get() == b.get());
    }

    template<typename T, typename U>
    bool operator==(const ScopedPtr<T>& a, const U* b) {
        return (a.get() == b);
    }

    template<typename T, typename U>
    bool operator==(const T* a, const ScopedPtr<U>& b) {
        return (a == b.get());
    }


    template<typename T, typename U>
    bool operator!=(const ScopedPtr<T>& a, const ScopedPtr<U>& b) {
        return (a.get() != b.get());
    }

    template<typename T, typename U>
    bool operator!=(const ScopedPtr<T>& a, const U* b) {
        return (a.get() != b);
    }

    template<typename T, typename U>
    bool operator!=(const T* a, const ScopedPtr<U>& b) {
        return (a != b.get());
    }

}


#endif
