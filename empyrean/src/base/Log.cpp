#include <iostream>
#include "Log.h"


// Perhaps this should go into Constants.h
static const char* DEFAULT_LOG_FILE = "default.log";


namespace pyr {

    PYR_DEFINE_SINGLETON(Log)
    
    Log::Log() {
        _stream = 0;
    }
    
    Log::~Log() {
        close();
    }

    void Log::open(const std::string& filename) {
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

    bool Log::write(const std::string& message) {
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
        
        PYR_ASSERT(_stream, "_stream pointer was never set");

        // If there is a message passed in, put it
        // in the file.
        if (!message.empty()) {
            (*_stream) << message << std::endl;
            return true;
        } else {
            return false;
        }
    }

    void Log::close() {
        // Close the file if needs be
        if (_file.is_open()) {
            _file.close();
        }
        _stream = 0;
    }

}
