#include <iostream>
#include "Log.h"
#include "ScopedPtr.h"
#include "ThreadStorage.h"
#include "XMLParser.h"


namespace pyr {

    const LogLevel DefaultLevel = WARN;

    // Store the current indentation per-thread.  Otherwise threads mess with each other.
    const size_t INDENT_SIZE = 2;
    struct ThreadData {
        std::string spaces;
    };
    ThreadStorage<ThreadData> _threadData;


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
        static const string spaces(INDENT_SIZE, ' ');
        _threadData->spaces += spaces;
    }

    void Logger::unindent() {
        size_t size = _threadData->spaces.size();
        PYR_ASSERT(size >= INDENT_SIZE, "unindent() called too many times.");
        _threadData->spaces.resize(size - INDENT_SIZE);
    }

    bool Logger::enabled(LogLevel level) {
        return level >= _actualLevel;
    }

    void Logger::log(LogLevel level, const string& message) {
        if (enabled(level)) {
            const string& spaces = _threadData->spaces;

            Logger* p = this;
            // Maybe an 'additivity' flag a la log4j would be nice.
            while (p /*&& p->_additivity*/) {
                for (WriterSet::iterator i = p->_writers.begin();
                     i != p->_writers.end();
                     ++i
                ) {
                    (*i)->write(spaces + message);
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

    void Logger::clearAllWriters() {
	_writers.clear();
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



    namespace {
	Logger& _logLogger = Logger::get("pyr.Log");
	typedef std::map<string, LogWriterPtr> WriterMap;

	void setLoggerLevel(Logger& logger, const string& level) {
	    if (level == "ALL")          logger.setLevel(ALL);
	    else if (level == "VERBOSE") logger.setLevel(VERBOSE);
	    else if (level == "INFO")    logger.setLevel(INFO);
	    else if (level == "WARN")    logger.setLevel(WARN);
	    else if (level == "ERROR")   logger.setLevel(ERROR);
	    else if (level == "FATAL")   logger.setLevel(FATAL);
	    else if (level == "OFF")     logger.setLevel(OFF);
	    else PYR_LOG(_logLogger, ERROR) << "Invalid logger level: " << level;
	}

	void setLoggerWriters(Logger& logger, const WriterMap& map,
			      const string& writers
	) {
	}
    }

    void initializeLog(const string& logFile, const string& configFile) {
	try {
	    WriterMap writerMap;
	    
	    ScopedPtr<XMLNode> root(parseXMLFile(configFile));
	    if (root->getName() != "LogConfiguration") {
		PYR_LOG(_logLogger, ERROR) << "Invalid log configuration file root node name: " << root->getName();
	    }
	    for (size_t i = 0; i < root->getChildCount(); ++i) {
		XMLNode* child = root->getChild(i);

		// Is it an appender specification?
		if (child->getName() == "Writer") {
		    
		}

		// Is it a logger specification?
		if (child->getName() == "Logger") {
		    if (child->hasAttr("name")) {
			Logger& logger = Logger::get(child->getAttr("name"));
			if (child->hasAttr("level")) {
			    setLoggerLevel(logger, child->getAttr("level"));
			}
			if (child->hasAttr("writers")) {
			    setLoggerWriters(logger, writerMap, child->getAttr("appenders"));
			}
		    } else {
			_logLogger.log(ERROR, "Logger node has no name attribute.");
		    }
		} else if (child->getName() == "Writer") {
		    
		}
	    }
	}
	catch (const XMLParseError&) {
	    // File didn't exist or was invalid XML, so set up a reasonable
	    // configuration.
	    FILE* file = fopen(logFile.c_str(), "w");
	    if (!file) {
		PYR_LOG(_logLogger, ERROR) << "Error opening log file: "
					   << logFile;
	    } else {
		Logger& logger = Logger::get("");
		logger.clearAllWriters();
		logger.addWriter(new FileWriter(file));
	    }
	}
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
