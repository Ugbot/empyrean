#ifndef PYR_UTILITY_H
#define PYR_UTILITY_H


#include <string>
#include <vector>
#include "Debug.h"

// I have no idea where these are #defined, but they are.
#if defined(_MSC_VER) && MSC_VER <= 1300
#  if defined(min)
#     undef min
#  endif
#  if defined(max)
#     undef max
#  endif
#endif

namespace pyr {

    /**
     * From Loki (Modern C++ Design).  Used to generate an empty,
     * unique type based on another.
     */
    template<typename T>
    struct Type2Type {
        typedef T OriginalType;
    };
    
    
    // Lets you delete the contents of a container with std::for_each.
    template<typename T>
    void delete_function(T* p) {
        delete p;
    }


    /**
     * Inited is short for Initialized.  This template class lets you
     * initialize integer members in a class without using member
     * initializers or assignments in the constructor.  It's much easier
     * to remember to use this than those two.  ;)
     */
    template<typename T, T initVal = 0>
    class Inited {
    public:
        Inited() : _value(initVal) { }
        Inited(const T& t) : _value(t) { }

        operator       T&()       { return get(); }
        operator const T&() const { return get(); }

              T& get()       { return _value; }
        const T& get() const { return _value; }

    private:
        T _value;
    };


    /**
     * Same as Inited<T>, but can be used with floats or other types that
     * can't be used as template parameters.
     */
    template<typename T>
    class Zeroed {
    public:
        Zeroed() : _value(0) { }
        Zeroed(const T& t) : _value(t) { }

        operator       T&()       { return get(); }
        operator const T&() const { return get(); }

              T& operator->()       { return get(); }
        const T& operator->() const { return get(); }

              T& get()       { return _value; }
        const T& get() const { return _value; }

	private:
        T _value;
    };
    

    /**
     * Same as static_cast, except does some type checking (ideally only
     * in debug builds).  This only works for classes, not native types.
     */
    template<typename T, typename U>
    T checked_cast(U u) {
        T t = dynamic_cast<T>(u);
        PYR_ASSERT(t, "checked_cast failed");
        return t;
    }


    // These are perfect candidates for unit tests.
    // They are also perfect candidates for going into their own string header.


    std::string itos(int i);


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

    /**
     * Returns a joining of the two paths into one, by inserting a slash
     * if necessary.
     */
    std::string joinPath(const std::string& s1, const std::string& s2);

    /// Returns true iff the path exists.
    bool fileExists(const std::string& path);

    /** Does the printf thing; returns a string.
     * (it rhymes!)
     */
    std::string va(const char* s, ...);

    /** Round a number to the nearest integer (0.5 rounded up) */
    int round(float num);

    /** Get the sign of the number */
    int sgn(float num);
}

#endif
