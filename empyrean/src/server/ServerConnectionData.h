#ifndef PYR_SERVER_CONNECTION_DATA_H
#define PYR_SERVER_CONNECTION_DATA_H

#include "Account.h"
#include "Connection.h"

namespace pyr {

    class ServerConnectionData : public ConnectionData {
    public:
        ServerConnectionData() {
        }

        ServerConnectionData(const ServerConnectionData& rhs) {
            *this = rhs;
        }

        Inited<bool, false> loggedIn;
        AccountPtr account;
    };

}

#endif
