#include <iostream>
#include "Log.h"
#include "ScopedPtr.h"
#include "Thread.h"
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

    const string& Logger::getName() const {
        return _name;
    }

    bool Logger::enabled(LogLevel level) {
        return level >= _actualLevel;
    }

    void Logger::log(LogLevel level, const string& message) {
        if (enabled(level)) {
            const string& spaces = _threadData->spaces;

            std::ostringstream os;
            os << '[' << pad(16, Thread::getCurrentThreadName()) << "] "
               << spaces << message;
            
            Logger* p = this;
            // Maybe an 'additivity' flag a la log4j would be nice.
            while (p /*&& p->_additivity*/) {
                for (WriterSet::iterator i = p->_writers.begin();
                     i != p->_writers.end();
                     ++i
                ) {
                    (*i)->write(os.str());
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
        if (name.empty()) {
            return *this;
        }

        string::size_type dot = name.find('.');
        string childName = (dot == string::npos
            ? name
            : name.substr(0, dot));

        Logger* child;
        if (childName.empty()) {
            child = this;
        } else {
            child = _children[childName];
            if (!child) {
                child = new Logger(childName, this);
                _children[childName] = child;
            }
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
	    else PYR_LOG(_logLogger, ERROR, "Invalid logger level: " << level);
	}

        LogWriterPtr getWriter(
            const WriterMap& writerMap,
            const string& writer
        ) {
            WriterMap::const_iterator i = writerMap.find(writer);
            if (i == writerMap.end()) {
                return 0;
            } else {
                return i->second;
            }
        }

	void setLoggerWriters(
            Logger& logger,
            const WriterMap& map,
            const string& writers
	) {
            std::vector<string> writerNames = splitString(writers, " ,\t");
            std::vector<LogWriterPtr> writerList;

            for (size_t i = 0; i < writerNames.size(); ++i) {
                string name = writerNames[i];
                LogWriterPtr writer = getWriter(map, name);
                if (writer) {
                    writerList.push_back(writer);
                } else {
                    PYR_LOG(_logLogger, WARN,
                        "Can't find writer '" << name << "' for logger '"
                            << logger.getName() << "'");
                }
            }

            logger.clearAllWriters();
            for (size_t i = 0; i < writerList.size(); ++i) {
                logger.addWriter(writerList[i]);
            }
	}
    }

    void initializeDefaults(const string& logFile) {
        LogWriterPtr writer;
        if (FILE* file = fopen(logFile.c_str(), "w")) {
            writer = new FileWriter(file);
        } else {
            PYR_LOG(_logLogger, ERROR, "Error opening log file: " << logFile);
            writer = new StreamWriter(&std::cout, false);
        }

        Logger& logger = Logger::get("");
        logger.clearAllWriters();
        logger.addWriter(writer);

        _logLogger.log(WARN, "Using default log configuration.");
    }

    void initializeLog(const string& logFile, const string& configFile) {
        WriterMap writerMap;
        ScopedPtr<XMLNode> root;

	try {
            root = parseXMLFile(configFile);
            if (!root) {
                return initializeDefaults(logFile);
            }
        }
        catch (const XMLParseError&) {
            return initializeDefaults(logFile);
        }

        if (root->getName() != "LogConfiguration") {
            PYR_LOG(_logLogger, ERROR, "Invalid log configuration file root node name: " << root->getName());
            return initializeDefaults(logFile);
        }

        for (size_t i = 0; i < root->getChildCount(); ++i) {
            XMLNode* child = root->getChild(i);

            // Is it a writer specification?
            if (child->getName() == "Writer") {
                if (child->hasAttr("name") && child->hasAttr("type")) {
                    string name = child->getAttr("name");
                    LogWriterPtr writer = createLogWriter(child);
                    if (writer) {
                        writerMap[name] = writer;
                    } else {
                        PYR_LOG(_logLogger, WARN, "Could not create writer: " << name);
                    }
                } else {
                    _logLogger.log(ERROR, "Writer node has no name and/or no type.");
                }
            }

            // Is it a logger specification?
            if (child->getName() == "Logger") {
                if (child->hasAttr("name")) {
                    Logger& logger = Logger::get(child->getAttr("name"));
                    if (child->hasAttr("level")) {
                        setLoggerLevel(logger, child->getAttr("level"));
                    }
                    if (child->hasAttr("writers")) {
                        setLoggerWriters(logger, writerMap, child->getAttr("writers"));
                    }
                } else {
                    _logLogger.log(ERROR, "Logger node has no name attribute.");
                }
            }
	}
    }

}
