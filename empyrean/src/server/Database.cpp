#include <stdexcept>
#include <stdio.h>
#include "Database.h"
#include "ScopedPtr.h"
#include "XMLParser.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(Database)

    void Database::clear() {
        _accounts.clear();
    }
    
    void Database::load(const std::string& filename) {
        try {
            ScopedPtr<XMLNode> node(XMLParser().parse(filename));

            if (!node || node->getName() != "serverdatabase") {
                throw DatabaseError("Invalid server database file");
            }
            
            // Load into temporary lists so an exception doesn't mess up the
            // DB's state.
            std::vector<AccountPtr> accounts;
            
            for (size_t i = 0; i < node->getChildCount(); ++i) {
                XMLNode* subnode = node->getChild(i);
                if (subnode->getName() == "account") {
                    accounts.push_back(new Account(
                        subnode->getAttr("username"),
                        subnode->getAttr("password")));
                }
            }
            
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
            
            fprintf(file, "</serverdatabase>\n");
        }
        catch (const std::exception&) {
            fclose(file);
            throw;
        }
        
        fclose(file);
    }

    void Database::addAccount(AccountPtr account) {
        _accounts.push_back(account);
    }
    
    AccountPtr Database::getAccount(const std::string& username) const {
        for (size_t i = 0; i < _accounts.size(); ++i) {
            if (_accounts[i]->getUsername() == username) {
                return _accounts[i];
            }
        }
        return 0;
    }
    
}
