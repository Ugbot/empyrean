#ifndef PYR_DATABASE_H
#define PYR_DATABASE_H


#include <string>
#include <vector>


namespace pyr {

    class Account {
    public:
        const std::string& getUsername() const {
            return _username;
        }
        
    private:
        std::string _username;
        std::string _password;
    };
    
    
    class Character {
    public:
    };
    
    
    class Game {
    public:
    };
    

    class Database {
    public:
        void addAccount(const Account& account);
        Account* getAccount(const std::string& username);
    
    private:
        std::vector<Account>   _accounts;
        std::vector<Character> _characters;
        std::vector<Game>      _games;
    };

}


#endif
