#ifndef PYR_DATABASE_H
#define PYR_DATABASE_H


#include <string>
#include <vector>


namespace pyr {

    class Account {
    public:
        Account(const std::string& username, const std::string& password) {
            _username = username;
            _password = password;
        }
    
        const std::string& getUsername() const {
            return _username;
        }
        
        const std::string& getPassword() const {
            return _password;
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
        ~Database();
    
        void addAccount(Account* account);
        Account* getAccount(const std::string& username);
    
    private:
        std::vector<Account*>   _accounts;
        std::vector<Character*> _characters;
        std::vector<Game*>      _games;
    };

}


#endif
