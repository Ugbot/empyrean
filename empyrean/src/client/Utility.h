#ifndef PYR_UTILITY_H
#define PYR_UTILITY_H


namespace pyr {

    /**
     * Loki's Type2Type.
     */
    template<typename T>
    struct Type2Type {
        typedef T OriginalType;
    };

    /**
     * This smart pointer is roughly analogous to boost's scoped_ptr.
     * It has destructive copy, and thus, is not container-safe.
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
            return get();
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
    
    private:
        T* _array;
    };

}


#endif
