#include "ConnectionHolder.h"
#include "PacketTypes.h"
#include "ServerAppearance.h"


namespace pyr {

    void ServerAppearance::sendAppearanceChanges(u16 id, std::vector<Packet*>& packets) {
        for (size_t i = 0; i < _commands.size(); ++i) {
            packets.push_back(new AppearancePacket(
                id, AP_COMMAND, _commands[i]));
        }
        _commands.clear();

        for (size_t i = 0; i < _animations.size(); ++i) {
            packets.push_back(new AppearancePacket(
                id, AP_ANIMATION, _animations[i]));
        }
        _animations.clear();

        for (size_t i = 0; i < _animationCycles.size(); ++i) {
            packets.push_back(new AppearancePacket(
                id, AP_ANIMATION_CYCLE, _animationCycles[i]));
        }
        _animationCycles.clear();
    }

}
