#include <stdexcept>
#include <stdio.h>
#include "Database.h"
#include "Utility.h"
#include "XMLParser.h"


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
        clear();
    }
    
    void Database::clear() {
        for (size_t i = 0; i < _accounts.size(); ++i) {
            delete _accounts[i];
        }
        for (size_t i = 0; i < _characters.size(); ++i) {
            delete _characters[i];
        }
        for (size_t i = 0; i < _games.size(); ++i) {
            delete _games[i];
        }

        _accounts.clear();
        _characters.clear();
        _games.clear();
    }
    
    void Database::load(const std::string& filename) {
        try {
            XMLParser parser;
            ScopedPtr<XMLNode> node = parser.parse(filename);
            
            if (!node || node->getName() != "serverdatabase") {
                throw DatabaseError("Invalid server database file");
            }
            
            std::vector<Account*> accounts;
            
            for (size_t i = 0; i < node->getChildCount(); ++i) {
                XMLNode* actnode = node->getChild(i);
                if (actnode->getName() == "account") {
                    Account* account = new Account(
                        actnode->getAttr("username"),
                        actnode->getAttr("password"));
                    accounts.push_back(account);
                }
            }
            
            clear();
            _accounts = accounts;
        }
        catch (const XMLParseError& e) {
            throw DatabaseError("XML Parse Error: " + std::string(e.what()));
        }
    }
    
    void Database::save(const std::string& filename) const {
        FILE* file = fopen(filename.c_str(), "w");
        if (!file) {
            throw DatabaseError("Couldn't open file for saving: " + filename);
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
