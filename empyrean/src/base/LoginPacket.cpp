#include "LoginPacket.h"


namespace pyr {

    LoginPacket::LoginPacket(
        const std::string& username,
        const std::string& password)
    {
        _username = username;
        _password = password;
    }
    
    void LoginPacket::serialize(ByteBuffer& out) const {
        out.add_u16(_username.length());
        out.add_u16(_password.length());
        out.add(_username.c_str(), _username.length());
        out.add(_password.c_str(), _password.length());
    }
    
    Packet* LoginPacket::create(int size, const void* bytes) {
        std::string username;
        std::string password;
        
        u16* p_username_size = (u16*)bytes;
        u16* p_password_size = (u16*)bytes + 1;
        
        u16 username_size = PR_ntohs(*p_username_size);
        u16 password_size = PR_ntohs(*p_password_size);
        
        if (size >= username_size + password_size + 4) {
            char* buffer = (char*)bytes + 4;
            username.assign(
                buffer,
                buffer + username_size);
            password.assign(
                buffer + username_size,
                buffer + username_size + password_size);
            return new LoginPacket(username, password);
        } else {
            return 0;
        }
    }

}
