#ifndef PLAYER_STATE_PACKET_H
#define PLAYER_STATE_PACKET_H


#include "BufferParser.h"
#include "Packet.h"


namespace pyr {

    class PlayerStatePacket : public Packet {
    public:
	PYR_PACKET_ID(7);

	PlayerStatePacket(float force) {
	    _force = force;
	}

	float getForce() const {
	    return _force;
	}

	void serialize(ByteBuffer& out) const {
	    out.add_float(_force);
	}

	static Packet* create(int size, const void* bytes) {
	    BufferParser bp(size, bytes);
	    float force = bp.read_float();
	    if (bp.passedEnd()) {
		return 0;
	    } else {
		return new PlayerStatePacket(force);
	    }
	}

    private:
	/**
	 * This is the "force" component on the x axis.  It is
	 * directly related to the left and right arrow keys.
	 */
	float _force;
    };

}


#endif
