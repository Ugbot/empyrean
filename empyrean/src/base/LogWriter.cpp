#if defined(WIN32)
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#endif

#include "LogWriter.h"


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
        fprintf(_file, "%s\n", message.c_str());
        fflush(_file);
    }


#ifdef WIN32
    void Win32DebugWriter::write(const string& message) {
        OutputDebugString((message + "\n").c_str());
    }
#endif


#if 0
    LogWriterPtr createLogWriter(const string& name, const string& argument) {
        if (name == "stdout") {
            return new StreamWriter(&cout, false);
        } else if (name == "stderr") {
            return new StreamWriter(&cerr, false);
        } else if (name == "file") {
            FILE* file = fopen(argument.c_str(), "w");
            return (file ? return new FileWriter(file) : 0);
        } else if (name == "win32debug") {
#ifdef WIN32
            return new Win32DebugWriter;
#endif
        }

        return 0;
    }
#endif

}
