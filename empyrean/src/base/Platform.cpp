#include "Log.h"
#include "Platform.h"


#ifdef WIN32


#include <windows.h>

std::string pyr::getStartDirectory(int /*argc*/, char* /*argv*/[]) {
    char filename[MAX_PATH];
    GetModuleFileName(GetModuleHandle(0), filename, MAX_PATH);
    if (char* backslash = strrchr(filename, '\\')) {
        *backslash = 0;
        return filename;
    } else {
        return "";
    }
}

// Cygwin cannot use the Win32 code path because Cygwin maintains its
// own internal current directory independent of the Win32 one.
#ifdef __CYGWIN__

#include <unistd.h>

inline bool changeDirectory(const char* path) {
    return chdir(path) == 0;
}

#else

inline bool changeDirectory(const char* path) {
    return SetCurrentDirectory(path) != FALSE;
}

#endif // #ifdef __CYGWIN__


#else  // If it's not Windows, it's probably UNIX


#include <stdlib.h>
#include <string.h>
#include <unistd.h>

std::string pyr::getStartDirectory(int argc, char* argv[]) {
    if (argc < 1) {
        return "";
    }

    std::string rv;

    char* path = strdup(argv[0]);
    if (char* slash = strrchr(path, '/')) {
        *slash = 0;
        rv = path;
    }

    free(path);
    return rv;
}

inline bool changeDirectory(const char* path) {
    return chdir(path) == 0;
}


#endif // #ifdef WIN32


void pyr::setStartDirectory(int argc, char* argv[]) {
    std::string startDir = getStartDirectory(argc, argv);
    PYR_LOG() << "Setting start directory to: " << startDir;
    if (!startDir.empty()) {
        if (!changeDirectory(startDir.c_str())) {
            PYR_LOG() << "SetCurrentDirectory() failed";
        }
    }
}
