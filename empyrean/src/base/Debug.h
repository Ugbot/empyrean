#ifndef PYR_ASSERT_H
#define PYR_ASSERT_H


#define PYR_REQUIRE_SEMI \
    do { } while (false)


#if defined(DEBUG) || defined(_DEBUG)

    #ifdef _MSC_VER
    
        namespace pyr {

            // Do the MessageBox in a source file to avoid namespace pollution.
            void showMessageBox(const char* text, const char* caption);

        }

        #define PYR_ASSERT(condition, label)                    \
            if (!(condition)) {                                 \
                showMessageBox((label), "Empyrean Assertion");  \
                __asm int 3                                     \
            } PYR_REQUIRE_SEMI
        
    #else

        #include <assert.h>
    
        #define PYR_ASSERT(condition, label) assert((condition) && (label))
    
    #endif

#else

    #define PYR_ASSERT(condition, label) PYR_REQUIRE_SEMI

#endif


namespace pyr {

    void registerLeakChecker();

}


#endif
