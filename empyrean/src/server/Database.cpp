#include "Database.h"


namespace pyr {

    Database::~Database() {
        for (size_t i = 0; i < _accounts.size(); ++i) {
            delete _accounts[i];
        }
    }

    void Database::addAccount(Account* account) {
        _accounts.push_back(account);
    }
    
    Account* Database::getAccount(const std::string& username) {
        for (size_t i = 0; i < _accounts.size(); ++i) {
            if (_accounts[i]->getUsername() == username) {
                return _accounts[i];
            }
        }
        return 0;
    }

}
