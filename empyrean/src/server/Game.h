#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>
#include <vector>
#include "ConnectionHolder.h"
#include "Types.h"
#include "UIDGenerator.h"


namespace pyr {

    class ServerEntity;
    class SetVelocityPacket;

    class Game : public ConnectionHolder {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();
        
        const std::string& getName() const;
        const std::string& getPassword() const;
        
        void update(float dt);
        
    private:
        struct ConnectionData {
            ServerEntity* playerEntity;
        };

        static ConnectionData* getData(Connection* c);
        
        void addEntity(ServerEntity* entity);
        void removeEntity(ServerEntity* entity);

        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        void handleSetVelocity(Connection*, SetVelocityPacket* p);

        std::string _name;
        std::string _password;
        
        std::vector<ServerEntity*> _entities;

        UIDGenerator<u16> _idGenerator;
    };

}


#endif
