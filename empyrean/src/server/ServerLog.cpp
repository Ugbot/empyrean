#include "ServerLog.h"
#include "Server.h"
#include "Log.h"


namespace pyr {

    void logMessage(const std::string& s) {
        // use the wxWindows logging system because it's thread-safe
        wxGetApp().log(s);

        // Log this in the file
        the<Log>().write(s);
    }

}
