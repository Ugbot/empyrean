#include "Log.h"
#include "Platform.h"


// Cygwin cannot use the Win32 code path because Cygwin maintains its
// own internal current directory independent of the Win32 one.  (But it
// updates the Win32 one when the Cygwin one changes.)
#if defined(WIN32) && !defined(__CYGWIN__)

#include <windows.h>

bool pyr::setCurrentDirectory(const std::string& path) {
    return SetCurrentDirectory(path) != FALSE;
}

std::string pyr::getCurrentDirectory() {
    char buffer[MAX_PATH + 1];
    if (GetCurrentDirectory(buffer, MAX_PATH)) {
        return buffer;
    } else {
        return "";
    }
}

#else

#include <unistd.h>

bool pyr::setCurrentDirectory(const std::string& dir) {
    return chdir(dir.c_str()) == 0;
}

std::string pyr::getCurrentDirectory() {
    char buffer[2048];
    char* rv = getcwd(buffer, sizeof(buffer));
    return (rv ? rv : 0);
}

#endif


// Now that we've got setCurrentDirectory() and getCurrentDirectory(), we
// can implement {get,set}StartDirectory.


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


#endif // #ifdef WIN32


void pyr::setStartDirectory(int argc, char* argv[]) {
    std::string startDir = getStartDirectory(argc, argv);
    PYR_LOG() << "Setting start directory to: " << startDir;
    if (!startDir.empty()) {
        if (!setCurrentDirectory(startDir.c_str())) {
            PYR_LOG() << "SetCurrentDirectory() failed";
        }
    }
}
