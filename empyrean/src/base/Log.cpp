//#define PYR_LOG_TO_STDOUT
//#define PYR_LOG_TO_WIN32_DEBUGGER

#if defined(WIN32)
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#endif

#include <iostream>
#include "Log.h"
#include "ThreadStorage.h"


namespace pyr {

    const LogLevel DefaultLevel = WARN;

    // Store the current indentation per-thread.  Otherwise threads mess with each other.
    struct ThreadData {
        Zeroed<int> indentation;
    };

    ThreadStorage<ThreadData> _threadData;
    
    
    class StreamWriter : public LogWriter {
    public:
        StreamWriter(std::ostream* stream, bool shouldDelete)
        : _stream(stream)
        , _shouldDelete(shouldDelete) {
        }
        
    protected:
        ~StreamWriter() {
            if (_shouldDelete) {
                delete _stream;
            }
        }
        
    public:
        void write(const string& message) {
            *_stream << std::string(_threadData->indentation * 2, ' ') << message << std::endl;
        }
        
    private:
        std::ostream* _stream;
        bool _shouldDelete;
    };
    

    
    Logger Logger::_root("", 0);
    
    Logger::Logger(const string& name, Logger* parent) {
        _parent = parent;
        _name = (_parent && !_parent->_name.empty()
            ? _parent->_name + "." + name
            : name);
            
        inheritLevel();
        
        // Root Logger gets a default writer.
        if (!_parent) {
            addWriter(new StreamWriter(&std::cerr, false));
        }
    }
    
    Logger::~Logger() {
        // delete children
        for (ChildMap::iterator i = _children.begin();
             i != _children.end();
             ++i
        ) {
            delete i->second;
        }
    }

    Logger& Logger::get(const string& name) {
        return _root.getChild(name);
    }
    
    void Logger::indent() {
        _threadData->indentation += 1;
    }
    
    void Logger::unindent() {
        _threadData->indentation -= 1;
    }
    
    bool Logger::enabled(LogLevel level) {
        return level >= _actualLevel;
    }
    
    void Logger::log(LogLevel level, const string& message) {
        if (enabled(level)) {
            Logger* p = this;
            // Maybe an 'additivity' flag a la log4j would be nice.
            while (p /*&& p->_additivity*/) {
                for (WriterSet::iterator i = p->_writers.begin();
                     i != p->_writers.end();
                     ++i
                ) {
                    (*i)->write(message);
                }
                p = p->_parent;
            }
        }
    }

    void Logger::inheritLevel() {
        _inheritLevel = true;
        _setLevel = DefaultLevel;
        updateActualLevel();
    }
        
    void Logger::setLevel(LogLevel level) {
        _inheritLevel = false;
        _setLevel = level;
        updateActualLevel();
    }
    
    void Logger::addWriter(const LogWriterPtr& writer) {
        _writers.insert(writer);
    }
    
    void Logger::removeWriter(const LogWriterPtr& writer) {
        _writers.erase(writer);
    }
    
    void Logger::updateActualLevel() {
        Logger* p = this;
        while (p && p->_inheritLevel) {
            p = p->_parent;
        }
        
        _actualLevel = (p ? p->_setLevel : DefaultLevel);
    
        // Update children too.
        for (ChildMap::iterator i = _children.begin();
             i != _children.end();
             ++i
        ) {
            i->second->updateActualLevel();
        }
    }
    
    Logger& Logger::getChild(const string& name) {
        if (name == "") {
            return *this;
        }
        
        string::size_type dot = name.find('.');
        string childName = (dot == string::npos
            ? name
            : name.substr(0, dot));
        
        Logger* child = _children[childName];
        if (!child) {
            child = new Logger(childName, this);
            _children[childName] = child;
        }
    
        return child->getChild(dot == string::npos
            ? string("")
            : name.substr(dot + 1));
    }
    

    LogScope::LogScope(Logger& logger, LogLevel level, const string& name)
    : _logger(logger)
    , _level(level)
    , _name(name) {
        _logger.log(_level, _name + " {");
        _logger.indent();
    }

    LogScope::~LogScope() {
        _logger.unindent();
        _logger.log(_level, "}");
    }
    
    
    void initializeLog(const string& configFile) {
    }

#if 0    
    PYR_DEFINE_SINGLETON(Log)
    
    Log::Log() {
        _stream = 0;
    }

    Log::~Log() {
        close();
    }

    void Log::open(const std::string& filename) {
#if defined(WIN32) && defined(PYR_LOG_TO_STDOUT)
        AllocConsole();

#ifndef __CYGWIN__
        // See http://www.flipcode.com/cgi-bin/msg.cgi?showThread=00003996&forum=general&id=-1
        FILE* out = _fdopen(_open_osfhandle((intptr_t)GetStdHandle(STD_OUTPUT_HANDLE), _O_TEXT), "w");
        FILE* err = _fdopen(_open_osfhandle((intptr_t)GetStdHandle(STD_ERROR_HANDLE),  _O_TEXT), "w");
        if (out) *stdout = *out;
        if (err) *stderr = *err;
#endif
#endif

        if (_file.is_open()) {
            // Perhaps this should just close the current file and open
            // a new one.  Until then...
            throw LogFileOpenFailure("Log file already open");
        }

        // Open the file
        _file.open(filename.c_str());
        if (!_file.is_open()) {
            throw LogFileOpenFailure("Error opening file: " + filename);
        }

        _stream = &_file;
    }

    void Log::write(const std::string& message) {
        // If a file is not open, open the default one.
        if (!_file.is_open()) {
            try {
                open(DEFAULT_LOG_FILE);
            }
            catch (const LogFileOpenFailure&) {
                // use cerr as a last resort
                _stream = &std::cerr;
            }
        }

        doWrite(std::string(_indent * 2, ' ') + message);
    }

    void Log::beginBlock() {
        ++_indent;
    }

    void Log::endBlock() {
        --_indent;
        PYR_ASSERT(_indent >= 0, "endBlock() called too many times");
    }

    void Log::doWrite(const std::string& message) {
        PYR_ASSERT(_stream, "_stream pointer was never set");
        (*_stream) << message << std::endl;

#ifdef PYR_LOG_TO_STDOUT
        std::cout << message << std::endl;
#endif

#if defined(WIN32) && defined(PYR_LOG_TO_WIN32_DEBUGGER)
        OutputDebugString(message.c_str());
        OutputDebugString("\n");
#endif
    }

    void Log::close() {
#if defined(WIN32) && defined(PYR_LOG_TO_STDOUT)
        FreeConsole();
#endif

        // Close the file if needs be
        if (_file.is_open()) {
            _file.close();
        }
        _stream = 0;
    }

#endif

}
