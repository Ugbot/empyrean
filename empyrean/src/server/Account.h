#ifndef PYR_ACCOUNT_H
#define PYR_ACCOUNT_H

#include <string>
#include "Character.h"
#include "RefCounted.h"
#include "RefPtr.h"

namespace pyr {

    class Account : public RefCounted {
    protected:
        ~Account() { }

    public:
        Account(const std::string& username, const std::string& password);
        
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

        CharacterPtr _characters[4];
    };
    typedef RefPtr<Account> AccountPtr;

}

#endif
