#ifndef PYR_LOG_H
#define PYR_LOG_H

#include <fstream>
#include <sstream>
#include <string>
#include "Error.h"
#include "Singleton.h"

namespace pyr {

    /**
     * @file
     * @todo The log really needs to be stored in thread-local storage,
     * stored in a separate file or some such.
     */

    PYR_DEFINE_RUNTIME_ERROR(LogFileOpenFailure);


    /**
     * Singleton logging system.  Logs messages to the file specified in
     * the call to the file specified in open, otherwise default.log,
     * otherwise cerr.
     */
    class Log {
        PYR_DECLARE_SINGLETON(Log)

        Log();
        ~Log();

    public:
        void open(const std::string& filename);
        void write(const std::string& message);
        
        void beginBlock();
        void endBlock();

    private:
        void doWrite(const std::string& message);
        void close();  ///< private until somebody needs it.

        std::ostream* _stream;
        std::ofstream _file;
        Zeroed<int> _indent;
    };


    /**
     * Maybe more efficient than using PYR_LOG(), because PYR_LOG()
     * instantiates a std::ostringstream for every log request.
     */
    inline void writeLog(const std::string& message) {
        the<Log>().write(message);
    }


    /**
     * Provides an iostream-like interface to the log.  Use PYR_LOG
     * instead.
     */
    class LogStream : public std::ostringstream {
    public:
        ~LogStream() {
            writeLog(str());
        }

        /**
         * This is a little trick to convert an rvalue to an lvalue.
         * The problem is this: class temporaries created with
         * LogStream() are rvalues, which means they cannot be
         * assigned to FontStream& references.  Therefore, temporaries
         * cannot be used as arguments to the standard operator<<
         * overloads.
         *
         * However!  You CAN call methods on object rvalues and methods
         * CAN return lvalues!  This method effectively converts *this
         * from an rvalue to an lvalue using the syntax:
         * LogStream().get().
         */
        LogStream& get() {
            return *this;
        }
    };
    
    
    class LogBlock {
    public:
        LogBlock(const std::string& name) {
            _name = name;
            the<Log>().write("+" + _name);
            the<Log>().beginBlock();
        }

        ~LogBlock() {
            the<Log>().endBlock();
            the<Log>().write("-" + _name);
        }

    private:
        std::string _name;
    };


    /**
     * A convenience macro around pyr::LogStream().  Used as follows:
     * PYR_LOG() << blah blah blah;
     *
     * This is the preferred interface for streaming text to the log.
     */
    #define PYR_LOG() ::pyr::LogStream().get()

    #define PYR_LOG_BLOCK(name) ::pyr::LogBlock PYR_UNIQUE_NAME()(name);


};

#endif
