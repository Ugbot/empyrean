#include <iomanip>
#include <sstream>
#include "CallStack.h"
#include "Utility.h"


#if defined(_MSC_VER)

#include <windows.h>
#include <dbghelp.h>
#include <tlhelp32.h>
#include "Win32Memory.h"

namespace pyr {

    const int MAX_STACK_LENGTH = 16;
   

    PYR_DEFINE_RUNTIME_ERROR(Win32Error);
    
    
    // Needs to be a scope guard.  :(
    struct LocalFreeSentry {
        LocalFreeSentry(HLOCAL buf) { _buf = buf;      }
        ~LocalFreeSentry()          { LocalFree(_buf); }
        
    private:
        HLOCAL _buf;
    };

    void throwWin32Error(const char* function, DWORD error = GetLastError()) {
        // Should use RAII on buf.
        char* buf;
        int rv = FormatMessage(
            FORMAT_MESSAGE_ALLOCATE_BUFFER |  FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
            0,
            error,
            0,
            (LPSTR)&buf,
            0,
            0);
        LocalFreeSentry PYR_UNIQUE_NAME()(buf);
        if (rv == 0) {
            throw Win32Error("Win32 error in " + str(function) + " -- FormatMessage failed");
        } else {
            throw Win32Error(str(function) + ": " + buf);
        }
    }
    
    void outputDebugString(const std::string& str) {
        OutputDebugString(str.c_str());
    }
    
    void printWin32Error(const char* function, DWORD error = GetLastError()) {
        // Should use RAII on buf.
        char* buf;
        int rv = FormatMessage(
            FORMAT_MESSAGE_ALLOCATE_BUFFER |  FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
            0,
            error,
            0,
            (LPSTR)&buf,
            0,
            0);
        LocalFreeSentry PYR_UNIQUE_NAME()(buf);
        if (rv == 0) {
            outputDebugString("Win32 error in " + str(function) + " -- FormatMessage failed");
        } else {
            outputDebugString(str(function) + ": " + buf);
        }
    }
    
    
    //===========================================================================
    // Debugging Tools API (dbghelp.dll >= version 6.3.17.0)
    //===========================================================================
    typedef BOOL (__stdcall *SymCleanup_t)(
        IN HANDLE hProcess);

    typedef PVOID (__stdcall *SymFunctionTableAccess64_t)(
        HANDLE hProcess, 
        DWORD64 AddrBase);

    typedef BOOL (__stdcall *SymGetLineFromAddr64_t)(
        IN HANDLE hProcess, 
        IN DWORD64 dwAddr,
        OUT PDWORD pdwDisplacement, 
        OUT PIMAGEHLP_LINE64 Line);

    typedef DWORD64 (__stdcall *SymGetModuleBase64_t)(
        IN HANDLE hProcess, 
        IN DWORD64 dwAddr);

    typedef BOOL (__stdcall *SymGetModuleInfo64_t)(
        IN HANDLE hProcess, 
        IN DWORD64 dwAddr, 
        OUT PIMAGEHLP_MODULE64 ModuleInfo);

    typedef DWORD (__stdcall *SymGetOptions_t)(VOID);

    typedef BOOL (__stdcall *SymGetSymFromAddr64_t)(
        IN HANDLE hProcess, 
        IN DWORD64 dwAddr,
        OUT PDWORD64 pdwDisplacement, 
        OUT PIMAGEHLP_SYMBOL64 Symbol);

    typedef BOOL (__stdcall *SymFromAddr_t)(
        IN  HANDLE              hProcess,
        IN  DWORD64             Address,
        OUT PDWORD64            Displacement,
        IN OUT PSYMBOL_INFO     Symbol);

    typedef BOOL (__stdcall *SymInitialize_t)(
        IN HANDLE hProcess, 
        IN PSTR UserSearchPath, 
        IN BOOL fInvadeProcess);

    typedef DWORD64 (__stdcall *SymLoadModule64_t)(
        IN HANDLE hProcess, 
        IN HANDLE hFile,
        IN PSTR ImageName, 
        IN PSTR ModuleName, 
        IN DWORD64 BaseOfDll, 
        IN DWORD SizeOfDll);

    typedef DWORD (__stdcall *SymSetOptions_t)(
        IN DWORD SymOptions);

    typedef BOOL (__stdcall *StackWalk64_t)(
        DWORD MachineType, 
        HANDLE hProcess,
        HANDLE hThread, 
        LPSTACKFRAME64 StackFrame, 
        PVOID ContextRecord,
        PREAD_PROCESS_MEMORY_ROUTINE64 ReadMemoryRoutine,
        PFUNCTION_TABLE_ACCESS_ROUTINE64 FunctionTableAccessRoutine,
        PGET_MODULE_BASE_ROUTINE64 GetModuleBaseRoutine,
        PTRANSLATE_ADDRESS_ROUTINE64 TranslateAddress);

    typedef DWORD (__stdcall WINAPI *UnDecorateSymbolName_t)(
        PCSTR DecoratedName, 
        PSTR UnDecoratedName,
        DWORD UndecoratedLength, 
        DWORD Flags);

    typedef BOOL (__stdcall *SymGetSearchPath_t)(
        IN  HANDLE          hProcess,
        OUT PSTR            SearchPath,
        IN  DWORD           SearchPathLength);

    typedef BOOL (__stdcall *SymSetSearchPath_t)(
        IN HANDLE           hProcess,
        IN PSTR             SearchPath);
        

    static bool g_DbgHelpAPI = false;
    static SymCleanup_t               g_SymCleanup               = NULL;
    static SymFunctionTableAccess64_t g_SymFunctionTableAccess64 = NULL;
    static SymGetLineFromAddr64_t     g_SymGetLineFromAddr64     = NULL;
    static SymGetModuleBase64_t       g_SymGetModuleBase64       = NULL;
    static SymGetModuleInfo64_t       g_SymGetModuleInfo64       = NULL;
    static SymGetOptions_t            g_SymGetOptions            = NULL;
    static SymGetSymFromAddr64_t      g_SymGetSymFromAddr64      = NULL;
    static SymFromAddr_t              g_SymFromAddr              = NULL;
    static SymInitialize_t            g_SymInitialize            = NULL;
    static SymLoadModule64_t          g_SymLoadModule64          = NULL;
    static SymSetOptions_t            g_SymSetOptions            = NULL;
    static StackWalk64_t              g_StackWalk64              = NULL;
    static UnDecorateSymbolName_t     g_UnDecorateSymbolName     = NULL;
    static SymGetSearchPath_t         g_SymGetSearchPath         = NULL;
    static SymSetSearchPath_t         g_SymSetSearchPath         = NULL;

    static FARPROC getProcAddress(HMODULE dll, const char* fn) {
        FARPROC func = GetProcAddress(dll, fn);    
        if (!func) {
            throwWin32Error("GetProcAddress");
        }

        return func;
    }
    
    static void requireDbgHelpAPI() {
        if (g_DbgHelpAPI) {
            return;
        }
        
        HMODULE dll = LoadLibrary("dbghelp.dll");
        if (!dll) {
            throwWin32Error("LoadLibrary");
        }
        
        #define PYR_LOAD_SYMBOL(name) g_##name = (name##_t)getProcAddress(dll, #name)
        PYR_LOAD_SYMBOL(SymCleanup);
        PYR_LOAD_SYMBOL(SymFunctionTableAccess64);
        PYR_LOAD_SYMBOL(SymGetLineFromAddr64);
        PYR_LOAD_SYMBOL(SymGetModuleBase64);
        PYR_LOAD_SYMBOL(SymGetModuleInfo64);
        PYR_LOAD_SYMBOL(SymGetOptions);
        PYR_LOAD_SYMBOL(SymFromAddr);
        PYR_LOAD_SYMBOL(SymGetSymFromAddr64);
        PYR_LOAD_SYMBOL(SymInitialize);
        PYR_LOAD_SYMBOL(SymSetOptions);
        PYR_LOAD_SYMBOL(StackWalk64);
        PYR_LOAD_SYMBOL(UnDecorateSymbolName);
        PYR_LOAD_SYMBOL(SymLoadModule64);
        PYR_LOAD_SYMBOL(SymGetSearchPath);
        PYR_LOAD_SYMBOL(SymSetSearchPath);
        #undef PYR_LOAD_SYMBOL
        
        g_DbgHelpAPI = true;
    }


    static HANDLE g_process = 0;
    
    
    static void freeDbgHelpAPI() {
        // We can't cleanup, because the caller uses this functionality
        // from an atexit callback set up before this...
        //g_SymCleanup(g_process);
        
        // We should cleanup the loaded dbghelp.dll too.
        
        // We could fix this with a refcounting scheme for initializing the
        // callstack module.
    }

    static void requireProcessHandle() {
        if (g_process) {
            return;
        }
        
        requireDbgHelpAPI();
        
        g_process = GetCurrentProcess();
        if (!g_process) {
            throwWin32Error("GetCurrentProcess");
        }
        
        g_SymSetOptions(SYMOPT_LOAD_LINES | SYMOPT_UNDNAME);
            
        if (!g_SymInitialize(g_process, 0, FALSE)) {
            throwWin32Error("SymInitialize");
        }
        
        atexit(freeDbgHelpAPI);
        
        // Load symbols for process modules.
        DWORD proc_id = GetCurrentProcessId();
        HANDLE snap = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, proc_id);
        if (!snap) {
            printWin32Error("CreateToolhelp32Snapshot");
        } else {
            MODULEENTRY32 me;
	    me.dwSize = sizeof(MODULEENTRY32);
            if (Module32First(snap, &me)) {
                do {
                    DWORD64 result = g_SymLoadModule64(
                        g_process, NULL, me.szExePath, NULL,
                        (DWORD64)me.modBaseAddr, me.modBaseSize);
                    if (!result) {
                        printWin32Error("SymLoadModule64");
                    }
                } while (Module32Next(snap, &me));
	    }
    	
	    // Need a scope guard here.  :(
	    CloseHandle(snap);
	}
    }
    

    struct CallStack::Impl : public Win32Object {
        DWORD64 stack[MAX_STACK_LENGTH];
        Zeroed<size_t> stackLength;
        
        static bool isSupported() {
            return true;
        }
        
        void get() {
            requireProcessHandle();
            
            HANDLE thread = GetCurrentThread();
            if (!thread) {
                throw CallStackError("GetCurrentThread() failed");
            }
            
            // According to MSDN, GetThreadContext shouldn't be called
            // from a running thread.  However, we've found it seems to
            // work in practice.  See
            // http://www.flipcode.com/cgi-bin/msg.cgi?showThread=00005090&forum=general&id=-1
            // for solutions that don't use GetThreadContext.
            CONTEXT context;
            context.ContextFlags = CONTEXT_FULL;
            if (!GetThreadContext(thread, &context)) {
                throw CallStackError("GetThreadContext() failed");
            }

            STACKFRAME64 stackframe;
            ZeroMemory(&stackframe, sizeof(stackframe));
            // These modes might be different for the 64-bit archs?
            stackframe.AddrPC.Mode     = AddrModeFlat;
            stackframe.AddrStack.Mode  = AddrModeFlat;
            stackframe.AddrFrame.Mode  = AddrModeFlat;
            stackframe.AddrBStore.Mode = AddrModeFlat;
            
            stackframe.AddrPC.Offset    = context.Eip;
            stackframe.AddrStack.Offset = context.Esp;
            stackframe.AddrFrame.Offset = context.Ebp;
            
            while (stackLength < MAX_STACK_LENGTH) {
                BOOL b = g_StackWalk64(
                    IMAGE_FILE_MACHINE_I386,
                    g_process,
                    thread,
                    &stackframe,
                    &context,
                    0,
                    g_SymFunctionTableAccess64,
                    g_SymGetModuleBase64,
                    0);
                if (stackframe.AddrPC.Offset == 0) {
                    break;
                }
                
                if (!b) {
                    DWORD err = GetLastError();
                    // In some situations, StackWalk can segfault?
                    if (err == ERROR_INVALID_ADDRESS) {
                        throwWin32Error("StackWalk64", err);
                    }
                }
                
                stack[stackLength++] = stackframe.AddrPC.Offset;
            }
        }
        
        std::string asString() const {
            std::ostringstream os;
            for (size_t i = 0; i < stackLength; ++i) {
                os << asString(stack[i]);
            }
            return os.str();
        }

    private:        
        std::string asString(DWORD64 pc) const {
            requireProcessHandle();
            
            std::string module        = "<unknown-module>";
            DWORD64     module_offset = 0;
            std::string filename      = "<unknown-file>";
            DWORD64     line_number   = 0;
            std::string function      = "<unknown-function>";

            IMAGEHLP_MODULE64 mi;
            mi.SizeOfStruct = sizeof(mi);
            if (g_SymGetModuleInfo64(g_process, pc, &mi)) {
                module        = mi.ModuleName;
                module_offset = pc - mi.BaseOfImage;
            } else {
                printWin32Error("SymGetModuleInfo64");
            }
            
            char buf[sizeof(SYMBOL_INFO) + 512];
            SYMBOL_INFO* si = (SYMBOL_INFO*)buf;
            si->SizeOfStruct = sizeof(SYMBOL_INFO);
            si->MaxNameLen = sizeof(buf) - sizeof(SYMBOL_INFO);
            DWORD64 disp64;
            if (g_SymFromAddr(g_process, pc, &disp64, si)) {
                function = si->Name;
            } else {
                printWin32Error("SymFromAddr");
            }

            IMAGEHLP_LINE64 line64;
            line64.SizeOfStruct = sizeof(line64);
            DWORD disp32;
            if (g_SymGetLineFromAddr64(g_process, pc, &disp32, &line64)) {
                filename    = line64.FileName;
                line_number = line64.LineNumber;
            } else {
                printWin32Error("SymGetLineFromAddr64");
            }
            
            std::ostringstream os;
            os << module << "+" << std::hex << module_offset << " "
               << filename << "(" << line_number << ") "
               << function << "\n";
            return os.str();
        }
    };

}

#elif defined(HAVE_EXECINFO_H)

#include <execinfo.h>

namespace pyr {

    const int MAX_STACK_LENGTH = 16;

    struct CallStack::Impl {
        void* array[MAX_STACK_LENGTH];
        int length;
        
        static bool isSupported() {
            return true;
        }

        void get() {
            length = backtrace(array, MAX_STACK_LENGTH);
        }

        std::string asString() const {
            char** symbols = backtrace_symbols(array, length);
            if (symbols) {
                std::string rv;
                for (int i = 0; i < length; ++i) {
                    rv += symbols[i];
                    rv += '\n';
                }
                free(symbols);
                return rv;
            } else {
                return "";
            }
        }
    };

}

#elif defined(HAVE_UNWIND_H)

#include <unwind.h>

namespace pyr {

    const int MAX_STACK_LENGTH = 16;

    struct CallStack::Impl {
        _Unwind_Ptr stack[MAX_STACK_LENGTH];
        int length;

        static bool isSupported() {
            return true;
        }

        Impl() {
            length = 0;
        }

        void get() {
            length = 0;
            _Unwind_Backtrace(staticTrace, this);
        }

        std::string asString() const {
            std::ostringstream os;
            for (int i = 0; i < length; ++i) {
                os << std::hex << stack[i] << '\n';
            }
            return os.str();
        }

        _Unwind_Reason_Code trace(_Unwind_Context* ctx) {
            if (length < MAX_STACK_LENGTH) {
                stack[length++] = _Unwind_GetIP(ctx);
                return _URC_NO_REASON;
            } else {
                return _URC_END_OF_STACK;
            }
        }

        static _Unwind_Reason_Code staticTrace(
            _Unwind_Context* ctx, void* opaque
        ) {
            Impl* This = static_cast<Impl*>(opaque);
            return This->trace(ctx);
        }
    };

}

#else    // NULL IMPLEMENTATION

namespace pyr {

    struct CallStack::Impl {
        static bool isSupported() {
            return false;
        }

        void get() {
        }

        std::string asString() const {
            return "";
        }
    };

}

#endif


// CallStack common class implementation...  defers most of the work
// to Impl.

namespace pyr {

    bool CallStack::isSupported() {
        return Impl::isSupported();
    }

    CallStack::CallStack() {
        _impl = new Impl;
        _impl->get();
    }
    
    CallStack::CallStack(const CallStack& rhs) {
        _impl = new Impl(*rhs._impl);
    }
    
    CallStack::~CallStack() {
    }
    
    CallStack& CallStack::operator=(const CallStack& rhs) {
        if (&rhs != this) {
            *_impl = *rhs._impl;
        }
        return *this;
    }
    
    std::string CallStack::asString() const {
        return _impl->asString();
    }

}
