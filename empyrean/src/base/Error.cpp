#include "Error.h"

#if defined(WIN32) && !defined(_CONSOLE)

    #include <windows.h>
    
    void pyr::error(const std::string& message) {
        MessageBox(NULL, message.c_str(), "Empyrean Error", MB_ICONERROR);
    }

#else

    #include <iostream>

    void pyr::error(const std::string& message) {
        std::cerr << message << std::endl;
    }

#endif
