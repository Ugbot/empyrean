#ifndef PYR_ASSERT_H
#define PYR_ASSERT_H


/**
 * Use this in macros that require the user to enter a semicolon after it.
 */
#define PYR_REQUIRE_SEMI(BODY) do { BODY } while (false)

/// Nice utility function to stringize the expansion of the argument.
#define PYR_STR(name) #name
#define PYR_STR2(name) PYR_STR(name)


#if defined(DEBUG) || defined(_DEBUG)

    namespace pyr {

        // Do the MessageBox in a source file to avoid namespace pollution.
        void showAssertMessage(
            const char* condition,
            const char* label,
            const char* file,
            const char* line);

    }

    #ifdef _MSC_VER

        #define PYR_BREAK()     \
            PYR_REQUIRE_SEMI(   \
                __asm int 3     \
            )
    
        #define PYR_ASSERT(condition, label)                                            \
            PYR_REQUIRE_SEMI(                                                           \
                if (!(condition)) {                                                     \
                    showAssertMessage(#condition, label, __FILE__, PYR_STR2(__LINE__)); \
                    PYR_BREAK();                                                        \
                }                                                                       \
            )
        
    #else

        #include <assert.h>

        #define PYR_BREAK()     \
            PYR_REQUIRE_SEMI(   \
                ;               \
            )
      
        #define PYR_ASSERT(condition, label)                                            \
            PYR_REQUIRE_SEMI(                                                           \
                if (!(condition)) {                                                     \
                    showAssertMessage(#condition, label, __FILE__, PYR_STR2(__LINE__)); \
                    assert((condition) && (label));                                     \
                }                                                                       \
            )
    
    #endif

#else

    #define PYR_ASSERT(condition, label)    \
        PYR_REQUIRE_SEMI(                   \
            ;                               \
        )

    #define PYR_BREAK()     \
        PYR_REQUIRE_SEMI(   \
            ;               \
        )

#endif


namespace pyr {

    void registerLeakChecker();

}


#endif
