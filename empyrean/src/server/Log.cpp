#include "Log.h"
#include "Server.h"


namespace pyr {

    void logMessage(const std::string& s) {
        wxGetApp().log(s);
    }

}
