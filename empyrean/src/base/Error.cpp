#include <stdio.h>
#include "Error.h"

#if defined(WIN32) && !defined(_CONSOLE) && !defined(__CYGWIN__)

    #include <windows.h>
    
    void pyr::error(const std::string& message) {
        MessageBox(NULL, message.c_str(), "Empyrean Error", MB_ICONERROR);
    }

#else

    void pyr::error(const std::string& message) {
        fprintf(stderr, "%s\n", message.c_str());
    }

#endif
