#ifndef PYR_SERVER_APPEARANCE_H
#define PYR_SERVER_APPEARANCE_H

#include <vector>
#include "Appearance.h"

namespace pyr {

    class Packet;

    class ServerAppearance : public Appearance {
    public:
        ServerAppearance(const std::string& name, const std::string& resource) {
            _name = name;
            _resource = resource;
        }
        
        std::string getName() {
            return _name;
        }
        
        std::string getResource() {
            return _resource;
        }
        
        void sendCommand(const std::string& command) {
            _commands.push_back(command);
        }
        
        void beginAnimation(const std::string& animation) {
            _animations.push_back(animation);
        }

        void beginAnimationCycle(const std::string& animation) {
            _animationCycles.push_back(animation);
        }

        void sendAppearanceChanges(u16 id, std::vector<PacketPtr>& packets);
        void clearAppearanceChanges();

    protected:
        std::string _name;
        std::string _resource;

    private:
        std::vector<std::string> _commands;
        std::vector<std::string> _animations;
        std::vector<std::string> _animationCycles;
    };

}


#endif
