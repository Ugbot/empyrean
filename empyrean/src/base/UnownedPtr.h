#ifndef PYR_UNOWNED_H
#define PYR_UNOWNED_H


#include "Utility.h"


namespace pyr {

    /**
     * Don't use this type in your code.  It's there to prevent 'delete' from
     * being called on UnownedPtr objects.
     *
     * Note: This technique inspired by Mozilla's nsCOMPtr.
     */
    template<typename T>
    class UnownedDerivedSafe : public T {
    protected:
        UnownedDerivedSafe();

    private:
        UnownedDerivedSafe<T>& operator=(const T&);

        /// Prevents calling delete on an UnownedPtr.
        void operator delete(void*);
    };

    /**
     * UnownedPtr is a smart pointer that is intended to mean that the pointee
     * will not be deleted by this pointer and that the pointee's lifetime
     * exceeds the lifetime of the pointer.
     */
    template<typename T>
    class UnownedPtr {
    public:
        UnownedPtr(T* p = 0) {
            _ptr = p;
        }

        UnownedPtr(const UnownedPtr<T>& p) {
            _ptr = p._ptr;
        }

        ~UnownedPtr() {
        }

        UnownedDerivedSafe<T>* get() const {
            return reinterpret_cast<UnownedDerivedSafe<T>*>(_ptr);
        }

        UnownedDerivedSafe<T>* operator->() const {
            PYR_ASSERT(get() != 0, "Null UnownedPtr dereferenced");
            return get();
        }

        T& operator*() {
            PYR_ASSERT(get() != 0, "Null UnownedPtr dereferenced");
            return *get();
        }

        operator UnownedDerivedSafe<T>*() const {
            return get();
        }

        UnownedPtr<T>& operator=(UnownedPtr<T>& p) {
            _ptr = p._ptr;
            return *this;
        }

        UnownedPtr<T>& operator=(T* p) {
            _ptr = p;
            return *this;
        }

    private:
        T* _ptr;
    };


    template<typename T, typename U>
    bool operator==(const UnownedPtr<T>& a, const UnownedPtr<U>& b) {
        return (a.get() == b.get());
    }

    template<typename T, typename U>
    bool operator==(const UnownedPtr<T>& a, const U* b) {
        return (a.get() == b);
    }

    template<typename T, typename U>
    bool operator==(const T* a, const UnownedPtr<U>& b) {
        return (a == b.get());
    }


    template<typename T, typename U>
    bool operator!=(const UnownedPtr<T>& a, const UnownedPtr<U>& b) {
        return (a.get() != b.get());
    }

    template<typename T, typename U>
    bool operator!=(const UnownedPtr<T>& a, const U* b) {
        return (a.get() != b);
    }

    template<typename T, typename U>
    bool operator!=(const T* a, const UnownedPtr<U>& b) {
        return (a != b.get());
    }

}


#endif
