#include "Log.h"
#include "Server.h"


namespace pyr {

    void logMessage(const std::string& s) {
        // use the wxWindows logging system because it's thread-safe
        wxGetApp().log(s);
    }

}
