#include <stdexcept>
#include <stdio.h>
#include "Database.h"
#include "ScopedPtr.h"
#include "XMLParser.h"


namespace pyr {

    void Account::save(FILE* file) const {
        fprintf(
            file,
            "<account username=\"%s\" password=\"%s\"/>\n",
            getUsername().c_str(),
            getPassword().c_str());
    }
    
    
    void Character::save(FILE* file) const {
        fprintf(
            file,
            "<character name=\"%s\"/>\n",
            getName().c_str());
    }
    
    
    PYR_DEFINE_SINGLETON(Database)

    void Database::clear() {
        _accounts.clear();
        _characters.clear();
    }
    
    void Database::load(const std::string& filename) {
        try {
            XMLParser parser;
            ScopedPtr<XMLNode> node = parser.parse(filename);
            
            if (!node || node->getName() != "serverdatabase") {
                throw DatabaseError("Invalid server database file");
            }
            
            // Load into temporary lists so an exception doesn't mess up the
            // DB's state.
            std::vector<AccountPtr> accounts;
            std::vector<CharacterPtr> characters;
            
            for (size_t i = 0; i < node->getChildCount(); ++i) {
                XMLNode* subnode = node->getChild(i);
                if (subnode->getName() == "account") {
                    accounts.push_back(new Account(
                        subnode->getAttr("username"),
                        subnode->getAttr("password")));
                } else if (subnode->getName() == "character") {
                    characters.push_back(new Character(
                        subnode->getAttr("name")));
                }
            }
            
            clear();
            _accounts = accounts;
            _characters = characters;
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
    
    void Database::addCharacter(CharacterPtr character) {
        _characters.push_back(character);
    }
    
    CharacterPtr Database::getCharacter(const std::string& name) const {
        for (size_t i = 0; i < _characters.size(); ++i) {
            if (_characters[i]->getName() == name) {
                return _characters[i];
            }
        }
        return 0;
    }

}
