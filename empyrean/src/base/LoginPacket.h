#ifndef PYR_LOGIN_PACKET_H
#define PYR_LOGIN_PACKET_H


#include <string>
#include "Packet.h"


namespace pyr {

    class LoginPacket : public Packet {
    public:
        enum { ID = 1 };
    
        LoginPacket(const std::string& username,
                    const std::string& password);
                    
        const std::string& getUsername() const {
            return _username;
        }
        
        const std::string& getPassword() const {
            return _password;
        }
        
        u32 getID() {
            return ID;
        }
        
        void serialize(ByteBuffer& out);
        static Packet* create(int size, const void* bytes);
                    
    private:
        std::string _username;
        std::string _password;
    };

}


#endif
