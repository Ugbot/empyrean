#ifndef PYR_REF_PTR_H
#define PYR_REF_PTR_H


#include "Debug.h"


namespace pyr {

    /// A container-safe smart pointer used for refcounted classes.
    template<typename T>
    class RefPtr {
    public:
        RefPtr(T* ptr = 0) {
            _ptr = 0;
            *this = ptr;
        }

        RefPtr(const RefPtr<T>& ptr) {
            _ptr = 0;
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
     
        RefPtr<T>& operator=(T* ptr) {
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

        RefPtr<T>& operator=(const RefPtr<T>& ptr) {
            *this = ptr._ptr;
            return *this;
        }

        T* operator->() const {
            PYR_ASSERT(_ptr, "Accessing member of null pointer!");
            return _ptr;
        }

        T& operator*() const {
            PYR_ASSERT(_ptr, "Dereferencing null pointer!");
            return *_ptr;
        }

        operator bool() const {
            return (_ptr != 0);
        }

        T* get() const {
            return _ptr;
        }

    private:
        T* _ptr;
    };
    
    
    template<typename T, typename U>
    bool operator==(const RefPtr<T>& a, const RefPtr<U>& b) {
        return (a.get() == b.get());
    }

    template<typename T>
    bool operator==(const RefPtr<T>& a, const T* b) {
        return (a.get() == b);
    }

    template<typename T>
    bool operator==(const T* a, const RefPtr<T>& b) {
        return (a == b.get());
    }
    

    template<typename T, typename U>
    bool operator!=(const RefPtr<T>& a, const RefPtr<U>& b) {
        return (a.get() != b.get());
    }

    template<typename T>
    bool operator!=(const RefPtr<T>& a, const T* b) {
        return (a.get() != b);
    }

    template<typename T>
    bool operator!=(const T* a, const RefPtr<T>& b) {
        return (a != b.get());
    }
    
}


#endif
