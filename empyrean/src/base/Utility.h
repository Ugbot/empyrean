#ifndef PYR_UTILITY_H
#define PYR_UTILITY_H


#include <string>
#include <vector>


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

        const T& operator [](unsigned int idx) const {
            return _array[idx];
        }

        T& operator [](unsigned int idx) {
            return _array[idx];
        }
    
    private:
        T* _array;
    };

    /// Returns the string, stripped of leading and trailing whitespace
    std::string trimString(const std::string& s);

    /**
     * Splits the string based on the passed delimiters, and returns the
     * substrings as an array.
     *
     * @param s          The string to split.
     * @param delimiters A list of characters to use as token delimiters.
     */
    std::vector<std::string> splitString(
        const std::string& s,
        const std::string& delimiters=" \n\r\t");

    /** Returns the path passed, stripped of the extension.  The period is also removed.
     * ie. stripExtension("image.png") == "image"
     *
     * If there is no extension in the file at all, the string is returned unaltered.
     *
     */
    std::string stripExtension(const std::string& s);

    /** Returns the extension of the file path passed.  The period is included.
     * ie. getExtension("image.png") == ".png"
     *
     * If there is no extension in the string at all, nothing is returned.
     */
    std::string getExtension(const std::string& s);

    /** Returns the directory which contains the file in the path specified.
     * ie. getPath("images/intro/intro1.png") == "images/intro/"
     *
     * If there are no slashes in the path, nothing is returned.
     */
    std::string getPath(const std::string& s);

    /** Returns the filename from the path specified.
     * ie. getFilename("images/intro/intro1.png") == "intro1.png"
     *
     * If there are no slashes in the path, the string is returned unaltered.
     */
    std::string getFilename(const std::string& s);
}

#endif
