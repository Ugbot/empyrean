#if defined(WIN32)
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#endif

#include "Log.h"
#include "LogWriter.h"
#include "ScopedLock.h"
#include "XMLParser.h"


namespace pyr {

    StreamWriter::StreamWriter(std::ostream* stream, bool shouldDelete)
    : _stream(stream)
    , _shouldDelete(shouldDelete) {
    }

    StreamWriter::~StreamWriter() {
        if (_shouldDelete) {
            delete _stream;
        }
    }

    void StreamWriter::write(const string& message) {
        *_stream << message << std::endl;
    }


    FileWriter::FileWriter(FILE* file)
    : _file(file) {
    }

    FileWriter::~FileWriter() {
        fclose(_file);
    }

    void FileWriter::write(const string& message) {
        PYR_SYNCHRONIZE_SCOPE(_mutex);
        fprintf(_file, "%s\n", message.c_str());
        fflush(_file);
    }


#ifdef WIN32
    void Win32DebugWriter::write(const string& message) {
        OutputDebugString((message + "\n").c_str());
    }
#endif


    /**
     * Decorates a LogWriter that outputs to the console.  In Win32,
     * this allocates a console if necessary.
     */
    class ConsoleDecorator : public LogWriter {
    public:
        ConsoleDecorator(LogWriterPtr writer)
        : _writer(writer) {
          #if defined(WIN32) && !defined(_CONSOLE)
            AllocConsole();

           #ifndef __CYGWIN__
            // See http://www.flipcode.com/cgi-bin/msg.cgi?showThread=00003996&forum=general&id=-1
            FILE* out = _fdopen(_open_osfhandle((intptr_t)GetStdHandle(STD_OUTPUT_HANDLE), _O_TEXT), "w");
            FILE* err = _fdopen(_open_osfhandle((intptr_t)GetStdHandle(STD_ERROR_HANDLE),  _O_TEXT), "w");
            if (out) *stdout = *out;
            if (err) *stderr = *err;
           #endif

          #endif
        }

    protected:
        ~ConsoleDecorator() {
          #if defined(WIN32) && !defined(_CONSOLE)
            FreeConsole();
          #endif
        }

        void write(const string& message) {
            return _writer->write(message);
        }

    private:
        LogWriterPtr _writer;
    };


    namespace {
        Logger& _logger = Logger::get("pyr.LogWriter");
    }


    LogWriterPtr createLogWriter(XMLNode* definition) {
        PYR_ASSERT(definition, "Null LogWriter definition given.");
        if (!definition->hasAttr("type")) {
            return 0;
        }

        std::string name = definition->getAttr("name");
        std::string type = definition->getAttr("type");
        if (type == "stdout") {
            return new ConsoleDecorator(new StreamWriter(&std::cout, false));
        } else if (type == "stderr") {
            return new ConsoleDecorator(new StreamWriter(&std::cerr, false));
        } else if (type == "file") {
            if (definition->hasAttr("filename")) {
                string filename = definition->getAttr("filename");
                FILE* file = fopen(filename.c_str(), "w");
                if (file) {
                    return new FileWriter(file);
                } else {
                    PYR_LOG(_logger, ERROR, "Could not open log file: " << filename);
                }
            } else {
                PYR_LOG(_logger, WARN, "Writer '" << name << "' has no filename attribute.");
            }
        } else if (type == "win32debug") {
#ifdef WIN32
            return new Win32DebugWriter;
#endif
        }

        return 0;
    }

}
