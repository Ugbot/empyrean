#include "Database.h"


namespace pyr {

    void Database::addAccount(const Account& account) {
        _accounts.push_back(account);
    }
    
    Account* Database::getAccount(const std::string& username) {
        for (size_t i = 0; i < _accounts.size(); ++i) {
            if (_accounts[i].getUsername() == username) {
                return &_accounts[i];
            }
        }
        return 0;
    }

}
