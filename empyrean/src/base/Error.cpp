#include "Error.h"

#if defined(WIN32) && !defined(_CONSOLE)

    #include <windows.h>
    
    void pyr::error(const std::string& message) {
        fprintf(stderr, "%s\n", message.c_str());
        MessageBox(NULL, message.c_str(), "Empyrean Error", MB_ICONERROR);
    }

#else

    #include <stdio.h>

    void pyr::error(const std::string& message) {
        fprintf(stderr, "%s\n", message.c_str());
    }

#endif
