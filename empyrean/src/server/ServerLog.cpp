#include "ServerLog.h"
#include "Server.h"
#include "Log.h"


namespace pyr {

    void logServerMessage(const std::string& s) {
        // use the wxWindows logging system because it's thread-safe
        wxGetApp().log(s);

        // Send the message to the normal empyrean Log too.
        writeLog(s);
    }

}
