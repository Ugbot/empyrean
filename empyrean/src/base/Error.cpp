#include "Error.h"

#if defined(WIN32) && !defined(_CONSOLE)

    #include <windows.h>
    
    void pyr::error(const std::string& message) {
        MessageBox(NULL, message.c_str(), "Empyrean Error", MB_ICONERROR);
    }

#else

    #include <stdio.h>

    void pyr::error(const std::string& message) {
        fputs(message.c_str(), stderr);
    }

#endif
