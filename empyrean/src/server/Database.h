#ifndef PYR_DATABASE_H
#define PYR_DATABASE_H


#include <stdexcept>
#include <string>
#include <vector>
#include "Singleton.h"


namespace pyr {

    class Account {
    public:
        Account(const std::string& username, const std::string& password) {
            _username = username;
            _password = password;
        }
        
        void save(FILE* file) const;
    
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
        void save(FILE* file) const { }
    };
    
    
    class Game {
    public:
        void save(FILE* file) const { }
    };
    
    
    struct DatabaseError : std::runtime_error {
        DatabaseError(const std::string& what)
        : std::runtime_error(what) { }
    };
    

    class Database {
        PYR_DECLARE_SINGLETON(Database)    
    
        Database() { }
        ~Database();
        
    public:
        void clear();
    
        void load(const std::string& filename);
        void save(const std::string& filename) const;
    
        void addAccount(Account* account);
        Account* getAccount(const std::string& username);
    
    private:
        std::vector<Account*>   _accounts;
        std::vector<Character*> _characters;
        std::vector<Game*>      _games;
    };

}


#endif
