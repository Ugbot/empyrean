#include <memory>
#include <stdio.h>
#include "Configuration.h"
#include "XMLParser.h"


namespace pyr {

    const std::string FILENAME = "client.cfg";

    PYR_DEFINE_SINGLETON(Configuration)
    
    Configuration::Configuration() {
        screenWidth = 1024;
        screenHeight = 768;
        fullscreen = false;

        server = "localhost";
        username = "EmpyreanPlayer";
    }
    
    void Configuration::load() {
        try {
            std::auto_ptr<XMLNode> root(XMLParser().parse(FILENAME));
            if (root.get()) {
                for (size_t i = 0; i < root->getChildCount(); ++i) {
                    XMLNode* child = root->getChild(i);
                    std::string attr = child->getAttr("name");
                    std::string value = child->getAttr("value");
                    if (attr == "screenWidth") {
                        screenWidth = atoi(value.c_str());
                    } else if (attr == "screenHeight") {
                        screenHeight = atoi(value.c_str());
                    } else if (attr == "fullscreen") {
                        fullscreen = (value == "true");
                    } else if (attr == "server") {
                        server = value;
                    } else if (attr == "username") {
                        username = value;
                    }
                }
            }
        }
        catch (const XMLParseError& e) {
            throw ConfigurationError(
                "Error reading client configuration: " + std::string(e.what()));
        }
    }
    
    std::string str(const std::string& s) {
        return s;
    }
    std::string str(int i) {
        return itos(i);
    }
    std::string str(bool b) {
        return (b ? "true" : "false");
    }
    
    template<typename T>
    void writeAttr(FILE* file, const char* name, const T& t) {
        fprintf(file, "  <attr name=\"%s\" value=\"%s\"/>\n", name, str(t).c_str());
    }
    
    void Configuration::save() const {
        FILE* file = fopen(FILENAME.c_str(), "w");
        if (!file) {
            throw ConfigurationError("Error opening " + FILENAME);
        }
        
        fprintf(file, "<client-configuration>\n");
        writeAttr(file, "screenWidth", screenWidth);
        writeAttr(file, "screenHeight", screenHeight);
        writeAttr(file, "fullscreen", fullscreen);
        writeAttr(file, "server", server);
        writeAttr(file, "username", username);
        fprintf(file, "</client-configuration>\n");
        
        fclose(file);
    }
    
}
