#ifndef PYR_WORLD_H
#define PYR_WORLD_H


#include <list>


namespace pyr {

    class Connection;

    class World {
    public:
        static World& instance();
        
    private:
        static void destroy();
        
    public:
        void update(float dt);
        void addConnection(Connection* connection);
        void removeConnection(Connection* connection);
        
    private:
        static World* _instance;
    
        std::list<Connection*> _connections;
    };

}


#endif
