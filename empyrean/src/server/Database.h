#ifndef PYR_DATABASE_H
#define PYR_DATABASE_H


#include <stdexcept>
#include <string>
#include <vector>
#include "Account.h"
#include "Error.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Singleton.h"


namespace pyr {

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
        
    private:
        std::vector<AccountPtr> _accounts;
    };

}


#endif
