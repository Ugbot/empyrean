#include "Platform.h"


#if defined(WIN32)
#include <windows.h>
#else  // If it's not Windows, it's probably UNIX
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#endif


namespace pyr {

#if defined(WIN32)

    void setStartDirectory(int /*argc*/, char* /*argv*/[]) {
        // set the current path to where the executable resides
        char filename[MAX_PATH];
        GetModuleFileName(GetModuleHandle(0), filename, MAX_PATH);

        // remove the basename
        if (char* backslash = strrchr(filename, '\\')) {
            *backslash = 0;
            SetCurrentDirectory(filename);
        }
    }
    
#else

    void setStartDirectory(int argc, char* argv[]) {
        if (argc < 1) {
            return;
        }

        char* path = strdup(argv[0]);
        if (char* slash = strrchr(path, '/')) {
            *slash = 0;
            chdir(path);
        }
        
        free(path);
    }
    
#endif

}
