/**
 * @file
 * The logging subsystem design is based on log4j.
 */


#ifndef PYR_LOG_H
#define PYR_LOG_H


#include <map>
#include <set>
#include <sstream>
#include "Error.h"
#include "LogWriter.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Singleton.h"
#include "Types.h"

// Evil Win32.
#ifdef ERROR
#undef ERROR
#endif

namespace pyr {

    enum LogLevel {
        ALL,     // Lowest rank, turns all levels on.
        VERBOSE,
        INFO,
        WARN,
        ERROR,
        FATAL,
        OFF,     // Highest rank, turns all levels off.
    };
    

    class Logger {
    private:
        Logger(const string& name, Logger* parent);
        ~Logger();
    
    public:
        static Logger& get(const string& name);
        
        // These don't necessarily have to be in the Logger class.
        static void indent();
        static void unindent();

        const string& getName() const;
        
        bool enabled(LogLevel level);
        void log(LogLevel level, const string& message);
        
        void inheritLevel();
        void setLevel(LogLevel level);
        
	void clearAllWriters();
        void addWriter(const LogWriterPtr& writer);
        void removeWriter(const LogWriterPtr& writer);
        
    private:
        void updateActualLevel();
        Logger& getChild(const string& name);
        
        typedef std::map<string, Logger*> ChildMap;
        typedef std::set<LogWriterPtr> WriterSet;
    
        // Structural attributes. 
        string _name;
        Logger* _parent;
        ChildMap _children;
        
        // Properties that can be set by a configuration.
        bool _inheritLevel;     ///< Set by setLevel and inheritLevel.
        LogLevel _setLevel;     ///< Set by setLevel and inheritLevel.
        LogLevel _actualLevel;  ///< Propagated by parents, used for the actual test.
        WriterSet _writers;
                
        // Noncopyable.
        Logger(const Logger&);
        Logger& operator=(const Logger&);
    };
    
    inline bool operator==(const Logger& lhs, const Logger& rhs) {
        return &lhs == &rhs;
    }


    /**
     * A convenience macro for logging streams.  Used as follows:
     * PYR_LOG(logger, level, message << stuff);
     *
     * This is the preferred interface for streaming objects to the
     * log, although it might be too expensive for logging a single
     * stream.  For that, use logger.log(level, message);
     */
    #define PYR_LOG(logger, level, stream)              \
        if ((logger).enabled((level))) {                \
            std::ostringstream os;                      \
            os << stream;                               \
            (logger).log((level), os.str());            \
        } else PYR_REQUIRE_SEMI

    
    class LogScope {
    public:
        LogScope(Logger& logger, LogLevel level, const string& name);
        ~LogScope();

    private:
        Logger& _logger;
        LogLevel _level;
        string _name;
        bool _enabled;
    };

    #define PYR_LOG_SCOPE(logger, level, name) \
	::pyr::LogScope PYR_UNIQUE_NAME()(logger, level, name);
    
    
    void initializeLog(const string& logFile, const string& configFile);

};

#endif
