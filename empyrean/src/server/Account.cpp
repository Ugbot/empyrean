#include "Account.h"


namespace pyr {

    Account::Account(const std::string& username, const std::string& password) {
        _username = username;
        _password = password;

        // This is a hack until we know stuff about the characters.
        CharacterPtr onlyCharacter = new Character;
        std::fill(_characters, _characters + 4, onlyCharacter);
    }

    void Account::save(FILE* file) const {
        fprintf(
            file,
            "<account username=\"%s\" password=\"%s\"/>\n",
            getUsername().c_str(),
            getPassword().c_str());
    }
    
}
