#include "Log.h"
#include "ServerApp.h"
#include "ServerLog.h"

namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.ServerMessages");
    }

    void logServerMessage(const std::string& s) {
        // use the wxWindows logging system because it's thread-safe
        wxGetApp().log(s);

        // Send the message to the normal empyrean Log too.
        _logger.log(INFO, s);
    }

}
