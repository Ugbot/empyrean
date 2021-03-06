#ifndef PYR_UTILITY_H
#define PYR_UTILITY_H


#include <typeinfo>
#include <vector>
#include "Debug.h"
#include "Types.h"

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
     * unique type based on another.  This can be used as a lightweight
     * type representing another type.
     *
     * Since this is a pretty confusing type, here is why it is
     * useful: Two functions cannot have the same signature.  The
     * signature does not include the return type, so if there is ...
     *
     * char foo() { ... }
     * int  foo() { ... }
     *
     * ... (int)foo and (char)foo have the same signature.  The
     * solution is to add an empty parameter that has no name and has
     * a default value (and so doesn't have to be specified by the
     * user).
     *
     * char foo(Type2Type<char> = Type2Type<char>()) { }
     * int  foo(Type2Type<int>  = Type2Type<int>())  { }
     *
     * Now foo<int> and foo<char> have different signatures.  The
     * PYR_UNIQUE_SIGNATURE(T) macro makes this usage a little bit
     * easier to swallow.
     */
    template<typename T>
    struct Type2Type {
        typedef T OriginalType;
    };
    
    #define PYR_UNIQUE_SIGNATURE(T) Type2Type<T> = Type2Type<T>()
    
    
    /**
     * Generates a unique name for a variable by using the current line
     * number.
     *
     * Note: PYR_UNIQUE_NAME does not work if you're compiling with the
     *       /ZI (program database for edit and continue) option in VC++.
     *       Use /Zi instead.  See
     *       http://support.microsoft.com/default.aspx?scid=kb;en-us;199057
     */
    #define PYR_UNIQUE_NAME() PYR_CONCATENATE1(_unique_, __LINE__)
    #define PYR_CONCATENATE1(s1, s2) PYR_CONCATENATE0(s1, s2)
    #define PYR_CONCATENATE0(s1, s2) s1##s2
    

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

              T* operator&()       { return &_value; }
        const T* operator&() const { return &_value; }

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

              T* operator&()       { return &_value; }
        const T* operator&() const { return &_value; }

              T& get()       { return _value; }
        const T& get() const { return _value; }

	private:
        T _value;
    };
    

    template<typename T, typename U>
    bool check_type(U* u) {
        return (!u || dynamic_cast<T>(u) ? true : false);
    }

    template<typename T, typename U>
    bool check_type_ref(U& u) {
        try {
            dynamic_cast<T>(u);
            return true;
        }
        catch (const std::bad_cast&) {
        }
        return false;
    }

    /**
     * Same as static_cast, except does some type checking in debug
     * builds.
     * @{
     */
    template<typename T, typename U>
    T checked_cast(U* u) {
        PYR_ASSERT(!u || dynamic_cast<T>(u), "checked_cast failed.");
        return static_cast<T>(u);
    }

    template<typename T, typename U>
    T checked_cast_ref(U& u) {
        PYR_ASSERT((check_type<T, U>(u)), "checked_cast failed.");
        return static_cast<T>(u);
    }
    /**
     * @}
     */


    inline int getNextPowerOf2(int n) {
        int i = 1;
        while (i < n) {
            i *= 2;
        }
        return i;
    }


    // :(  This needs to go into the random number stuff, like Die.
    inline float randf() {
        return float(rand()) / RAND_MAX;
    }


    // These are perfect candidates for unit tests.
    // They are also perfect candidates for going into their own string header.


    string itos(int i);


    /// Returns the string, stripped of leading and trailing whitespace
    string trimString(const string& s);

    /**
     * Splits the string based on the passed delimiters, and returns the
     * substrings as an array.
     *
     * @param s          The string to split.
     * @param delimiters A list of characters to use as token delimiters.
     */
    std::vector<string> splitString(
        const string& s,
        const string& delimiters=" \n\r\t");

    /** Returns the path passed, stripped of the extension.  The period is also removed.
     * ie. stripExtension("image.png") == "image"
     *
     * If there is no extension in the file at all, the string is returned unaltered.
     *
     */
    string stripExtension(const string& s);

    /** Returns the extension of the file path passed.  The period is included.
     * ie. getExtension("image.png") == ".png"
     *
     * If there is no extension in the string at all, nothing is returned.
     */
    string getExtension(const string& s);

    /** Returns the directory which contains the file in the path specified.
     * ie. getPath("images/intro/intro1.png") == "images/intro/"
     *
     * If there are no slashes in the path, nothing is returned.
     */
    string getPath(const string& s);

    /** Returns the filename from the path specified.
     * ie. getFilename("images/intro/intro1.png") == "intro1.png"
     *
     * If there are no slashes in the path, the string is returned unaltered.
     */
    string getFilename(const string& s);

    /**
     * Returns a joining of the two paths into one, by inserting a slash
     * if necessary.
     */
    string joinPath(const string& s1, const string& s2);

    /// Returns true iff the path exists.
    bool fileExists(const string& path);

    /** Does the printf thing; returns a string.
     * (it rhymes!)
     */
    string va(const char* s, ...);

    /** Round a number to the nearest integer (0.5 rounded up) */
    int round(float num);

    /** Get the sign of the number */
    int sgn(float num);
    
    inline string str(const string& s) {
        return s;
    }

    inline string pad(size_t size, const string& s) {
        if (s.size() > size) {
            return s.substr(0, size);
        } else if (s.size() == size) {
            return s;
        } else {
            return s + string(size - s.size(), ' ');
        }
    }
}

#endif
