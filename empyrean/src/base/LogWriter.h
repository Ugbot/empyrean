#ifndef PYR_LOG_WRITER_H
#define PYR_LOG_WRITER_H


#include <iostream>
#include "RefCounted.h"
#include "RefPtr.h"
#include "Types.h"


namespace pyr {

    /**
     * Used to write lines into a log.
     */
    class LogWriter : public RefCounted {
    protected:
        ~LogWriter() { }

    public:
        /// Writes a line to a log sink.
        virtual void write(const string& message) = 0;
    };
    PYR_REF_PTR(LogWriter);


    class StreamWriter : public LogWriter {
    protected:
        ~StreamWriter();

    public:
        StreamWriter(std::ostream* stream, bool shouldDelete);

        void write(const string& message);

    private:
        std::ostream* _stream;
        bool _shouldDelete;
    };


    class FileWriter : public LogWriter {
    protected:
        ~FileWriter();

    public:
        FileWriter(FILE* file);

        void write(const string& message);

    private:
        FILE* _file;
    };


#ifdef WIN32
    class Win32DebugWriter : public LogWriter {
    protected:
        ~Win32DebugWriter() { }

    public:
        Win32DebugWriter() { }

        void write(const string& message);
    };
#endif

}


#endif
