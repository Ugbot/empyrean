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

    
    class FileWriter : public LogWriter {
    public:
        FileWriter(FILE* file)
        : _file(file) {
        }
        
    protected:
        ~FileWriter() {
            fclose(_file);
        }
        
    public:
        void write(const string& message) {
            string indent = std::string(_threadData->indentation * 2, ' ');
            fprintf(_file, "%s\n", message.c_str());
            fflush(_file);
        }
        
    private:
        FILE* _file;
    };
        
    
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
    
    
#ifdef WIN32    
    class Win32DebugWriter : public LogWriter {
    public:
        Win32DebugWriter(FILE* file) {
        }
        
    protected:
        ~Win32DebugWriter() {
        }
        
    public:
        void write(const string& message) {
            string indent = std::string(_threadData->indentation * 2, ' ');
            OutputDebugString((indent + message + "\n").c_str());
        }
    };
#endif

    
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
        // Initialize the root here so it it's guaranteed to be done before
        // it needs to be used.
        static Logger _root("", 0);
        return _root.getChild(name);
    }
    
    void Logger::indent() {
        _threadData->indentation += 1;
    }
    
    void Logger::unindent() {
        _threadData->indentation -= 1;
        PYR_ASSERT(_threadData->indentation >= 0, "unindent() called too many times.");
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
#endif


}
