#ifndef PYR_LOGIN_PACKET_H
#define PYR_LOGIN_PACKET_H


#include <string>
#include "Packet.h"


namespace pyr {

    class LoginPacket : public Packet {
    public:
        PYR_PACKET_ID(1);
    
        LoginPacket(const std::string& username,
                    const std::string& password);
                    
        const std::string& getUsername() const {
            return _username;
        }
        
        const std::string& getPassword() const {
            return _password;
        }
        
        void serialize(ByteBuffer& out) const;
        static Packet* create(int size, const void* bytes);
                    
    private:
        std::string _username;
        std::string _password;
    };

}


#endif
