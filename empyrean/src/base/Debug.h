#ifndef PYR_ASSERT_H
#define PYR_ASSERT_H


/**
 * Put this at the end of a macro if the user must enter a semicolon
 * after it.
 */
#define PYR_REQUIRE_SEMI do { } while (false)

/// Nice utility function to stringize the expansion of the argument.
#define PYR_STR(name) #name


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
    
        #define PYR_ASSERT(condition, label)                                        \
            if (!(condition)) {                                                     \
                showAssertMessage(#condition, label, __FILE__, PYR_STR(__LINE__));  \
                __asm int 3                                                         \
            } PYR_REQUIRE_SEMI
        
    #else

        #include <assert.h>
      
        #define PYR_ASSERT(condition, label)                                        \
            if (!(condition)) {                                                     \
                showAssertMessage(#condition, label, __FILE__, PYR_STR(__LINE__));  \
                assert((condition) && (label));                                     \
            } PYR_REQUIRE_SEMI
    
    #endif

#else

    #define PYR_ASSERT(condition, label) PYR_REQUIRE_SEMI

#endif


namespace pyr {

    void registerLeakChecker();

}


#endif
