#include "BufferParser.h"
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
	out.add_string(_username, 12);
	out.add_string(_password, 12);
    }
    
    Packet* LoginPacket::create(int size, const void* bytes) {
	BufferParser bp(size, bytes);
        std::string username = bp.read_string(12);
        std::string password = bp.read_string(12);
	if (bp.passedEnd()) {
	    return 0;
        } else {
	    return new LoginPacket(username, password);
        }
    }

}
