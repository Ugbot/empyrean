#include <stdio.h>
#include "Error.h"


#ifdef _MSC_VER

#include <windows.h>
#include <eh.h>

namespace {

#if 0    
    /**
     * In MSVC, catch(...) can catch win32 exceptions such as division by
     * zero and null pointer accesses.  Disable that behavior so we can
     * actually break into the debugger when we screw up.
     */
    void disableCatchAll(unsigned, EXCEPTION_POINTERS*) {
        throw;
    }

    _se_translator_function oldHandler = _set_se_translator(disableCatchAll);
#endif

}

#endif



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
