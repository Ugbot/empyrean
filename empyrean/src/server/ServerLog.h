#ifndef PYR_SERVER_LOG_H
#define PYR_SERVER_LOG_H


#include <sstream>
#include <string>


namespace pyr {

    void logServerMessage(const std::string& s);

    /// Same as pyr::LogStream, but logs to the server window.
    class ServerLogStream : public std::ostringstream {
    public:
        ~ServerLogStream() {
            logServerMessage(str());
        }

        ServerLogStream& get() {
            return *this;
        }
    };

    /// Same as PYR_LOG(), but logs to server window.
    #define PYR_SERVER_LOG() ::pyr::ServerLogStream().get()

}


#endif
