#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>


namespace pyr {

    class Game {
    public:
        Game(const std::string& name, const std::string& password);
        
        const std::string& getName() const {
            return _name;
        }
        
        const std::string& getPassword() const {
            return _password;
        }
    
        void update(float dt);
    
    private:
        std::string _name;
        std::string _password;
    };

}


#endif
