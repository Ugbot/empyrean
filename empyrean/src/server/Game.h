#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>
#include <vector>


namespace pyr {

    class Connection;
    class ServerEntity;

    class Game {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();
        
        const std::string& getName() const;
        const std::string& getPassword() const;
        
        void addConnection(Connection* connection);
            
        void update(float dt);
    
    private:
        std::string _name;
        std::string _password;
        
        std::vector<Connection*> _connections;
        std::vector<ServerEntity*> _entities;
    };

}


#endif
