#ifndef PYR_DATABASE_H
#define PYR_DATABASE_H


#include <stdexcept>
#include <string>
#include <vector>
#include "Error.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Singleton.h"


namespace pyr {

    class Account : public RefCounted {
    protected:
        ~Account() { }

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
    typedef RefPtr<Account> AccountPtr;
    
    
    class Character : public RefCounted {
    protected:
        ~Character() { }

    public:
        Character(const std::string& name) {
            _name = name;
        }
    
        void save(FILE* file) const;
        
        const std::string& getName() const {
            return _name;
        }
        
    private:
        std::string _name;
    };
    typedef RefPtr<Character> CharacterPtr;
    
    
    PYR_DEFINE_RUNTIME_ERROR(DatabaseError);
    

    class Database {
        PYR_DECLARE_SINGLETON(Database)    
    
        Database() { }
        ~Database() { }
        
    public:
        void clear();
    
        void load(const std::string& filename);
        void save(const std::string& filename) const;
    
        void addAccount(AccountPtr account);
        AccountPtr getAccount(const std::string& username) const;
        
        void addCharacter(CharacterPtr character);
        CharacterPtr getCharacter(const std::string& name) const;
    
    private:
        std::vector<AccountPtr>   _accounts;
        std::vector<CharacterPtr> _characters;
    };

}


#endif
