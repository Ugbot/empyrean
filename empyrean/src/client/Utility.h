#ifndef PYR_UTILITY_H
#define PYR_UTILITY_H

#include <string>
#include <vector>

#include <gmtl/Vec.h>
#include <SDL_opengl.h>


namespace pyr {

    using std::string;
    using std::vector;

    inline void glTranslate(const gmtl::Vec2f& vec) {
        glTranslatef(vec[0], vec[1], 0);
    }

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

        const T& operator [](unsigned int idx) const {
            return _array[idx];
        }

        T& operator [](unsigned int idx) {
            return _array[idx];
        }
    
    private:
        T* _array;
    };

    //! Returns the string, stripped of leading and trailing whitespace
    string trimString(const string& s);

    /** Splits the string based on the passed delimiters, and returns the substrings as an array.
     *
     * @param s          The string to split.
     * @param delimiters A list of characters to use as token delimiters.
     */
    vector<string> splitString(const string& s, const string& delimiters=" \n\r\t");
}

#endif
