#include <stdexcept>
#include <fstream>
#include "Database.h"


namespace pyr {

    void Account::save(FILE* file) const {
        fprintf(
            file,
            "<account username=\"%s\" password=\"%s\"/>\n",
            getUsername().c_str(),
            getPassword().c_str());
    }
    
    PYR_DEFINE_SINGLETON(Database)

    Database::~Database() {
        for (size_t i = 0; i < _accounts.size(); ++i) {
            delete _accounts[i];
        }
        for (size_t i = 0; i < _characters.size(); ++i) {
            delete _characters[i];
        }
        for (size_t i = 0; i < _games.size(); ++i) {
            delete _games[i];
        }
    }
    
    void Database::load(const std::string& filename) {
        
    }
    
    void Database::save(const std::string& filename) const {
        FILE* file = fopen(filename.c_str(), "w");
        if (!file) {
            throw std::runtime_error("Couldn't open file for saving: " + filename);
        }
        
        try {
            fprintf(file, "<serverdatabase>\n");

            for (size_t i = 0; i < _accounts.size(); ++i) {
                _accounts[i]->save(file);
            }
            for (size_t i = 0; i < _characters.size(); ++i) {
                _characters[i]->save(file);
            }
            for (size_t i = 0; i < _games.size(); ++i) {
                _games[i]->save(file);
            }
            
            fprintf(file, "</serverdatabase>\n");
        }
        catch (const std::exception&) {
            fclose(file);
            throw;
        }
        
        fclose(file);
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
