#include "Debug.h"


#if defined(DEBUG) || defined(_DEBUG)

    #ifdef _MSC_VER

        #ifndef STRICT
            #define STRICT
        #endif
        #ifndef WIN32_LEAN_AND_MEAN
            #define WIN32_LEAN_AND_MEAN
        #endif
        #ifndef NOMINMAX
            #define NOMINMAX
        #endif

        #include <windows.h>

        void pyr::showMessageBox(const char* text, const char* caption) {
            MessageBoxA(NULL, text, caption, MB_OK);
        }


    #endif

#endif
