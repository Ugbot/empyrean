#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>
#include <vector>
#include "ConnectionHolder.h"


namespace pyr {

    class ServerEntity;

    class Game : public ConnectionHolder {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();
        
        const std::string& getName() const;
        const std::string& getPassword() const;
        
        void update(float dt);
        
    private:
        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        std::string _name;
        std::string _password;
        
        std::vector<ServerEntity*> _entities;
    };

}


#endif
