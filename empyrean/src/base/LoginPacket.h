#ifndef PYR_LOGIN_PACKET_H
#define PYR_LOGIN_PACKET_H


#include <string>
#include "Packet.h"


namespace pyr {

    class LoginPacket : public Packet {
    public:
        LoginPacket(const std::string& username,
                    const std::string& password)
        {
            _username = username;
            _password = password;
        }
                    
        const std::string& getUsername() const {
            return _username;
        }
        
        const std::string& getPassword() const {
            return _password;
        }
                    
    private:
        std::string _username;
        std::string _password;
    };

}


#endif
