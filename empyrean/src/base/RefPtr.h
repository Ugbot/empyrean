#ifndef PYR_REF_PTR_H
#define PYR_REF_PTR_H


#include "Debug.h"
#include "Utility.h"


namespace pyr {

    /**
     * Don't use this type in your code.  It's there to prevent 'delete',
     * ref(), and unref() from being called on RefPtr objects.
     *
     * Note: This technique inspired by Mozilla's nsCOMPtr.
     */
    template<typename T>
    class RefDerivedSafe : public T {
    protected:
        RefDerivedSafe();

    private:
        RefDerivedSafe<T>& operator=(const T&);

        /// Prevents calling delete on a RefPtr.
        void operator delete(void*);

#if 0   // ref() and unref() are already private in RefCounted.  Uncomment
        // this if that ever changes.

        /// Let RefPtr manage ref() for you.
        using T::ref;

        /// Let RefPtr manage unref() for you.
        using T::unref;
#endif
    };


    /// A container-safe smart pointer used for refcounted classes.
    template<typename T>
    class RefPtr {
    public:
        // For compatibility with Boost.Python.
        typedef T element_type;

        RefPtr(T* ptr = 0) {
            *this = ptr;
        }

        RefPtr(const RefPtr<T>& ptr) {
            *this = ptr;
        }

        /**
         * This templated constructor allows you to do automatic conversions
         * to smart pointers of base classes.
         */
        template<typename U>
        RefPtr(const RefPtr<U>& ptr) {
            _ptr = ptr.get();
            if (_ptr) {
                _ptr->ref();
            }
        }
      
        ~RefPtr() {
            if (_ptr) {
                _ptr->unref();
                _ptr = 0;
            }
        }
     
        template<typename U>
        RefPtr<T>& operator=(U* ptr) {
            if (ptr != _ptr) {
                if (_ptr) {
                    _ptr->unref();
                }
                _ptr = ptr;
                if (_ptr) {
                    _ptr->ref();
                }
            }
            return *this;
        }

        template<typename U>
        RefPtr<T>& operator=(const RefPtr<U>& ptr) {
            *this = ptr.get();
            return *this;
        }

        /// Need this to override the built-in operator=
        RefPtr<T>& operator=(const RefPtr<T>& ptr) {
            *this = ptr.get();
            return *this;
        }

        RefDerivedSafe<T>* operator->() const {
            PYR_ASSERT(get(), "Accessing member of null pointer!");
            return get();
        }

        T& operator*() const {
            PYR_ASSERT(get(), "Dereferencing null pointer!");
            return *get();
        }

        operator RefDerivedSafe<T>*() const {
            return get();
        }

        RefDerivedSafe<T>* get() const {
            return reinterpret_cast<RefDerivedSafe<T>*>(_ptr.get());
        }

        /// If you really need the raw pointer...
        T* raw_ptr() const {
            return _ptr;
        }

    private:
        Zeroed<T*> _ptr;
    };
    
    
    // For compatibility with Boost.Python.
    template<class T>
    T* get_pointer(const RefPtr<T>& p) {
        return p.get();
    }


    template<typename T, typename U>
    bool operator==(const RefPtr<T>& a, const RefPtr<U>& b) {
        return (a.get() == b.get());
    }

    template<typename T, typename U>
    bool operator==(const RefPtr<T>& a, const U* b) {
        return (a.get() == b);
    }

    template<typename T, typename U>
    bool operator==(const T* a, const RefPtr<U>& b) {
        return (a == b.get());
    }


    template<typename T, typename U>
    bool operator!=(const RefPtr<T>& a, const RefPtr<U>& b) {
        return (a.get() != b.get());
    }

    template<typename T, typename U>
    bool operator!=(const RefPtr<T>& a, const U* b) {
        return (a.get() != b);
    }

    template<typename T, typename U>
    bool operator!=(const T* a, const RefPtr<U>& b) {
        return (a != b.get());
    }

}


#endif
