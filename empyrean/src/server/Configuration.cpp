#include <stdlib.h>
#include "Configuration.h"
#include "Constants.h"
#include "XMLParser.h"


namespace pyr {

    const std::string FILENAME = "server.cfg";
    
    PYR_DEFINE_SINGLETON(Configuration)

    Configuration::Configuration() {
        serverPort = constants::SERVER_PORT;
        shouldStartServer = true;
        
        windowPosition = wxDefaultPosition;
        windowSize     = wxDefaultSize;
    }

    void Configuration::load() {
        try {
            ScopedPtr<XMLNode> root = XMLParser().parse(FILENAME);
            if (root.get()) {
                for (size_t i = 0; i < root->getChildCount(); ++i) {
                    XMLNode* child = root->getChild(i);
                    std::string attr = child->getAttr("name");
                    std::string value = child->getAttr("value");
                    if (attr == "serverPort") {
                        serverPort = atoi(value.c_str());
                    } else if (attr == "shouldStartServer") {
                        shouldStartServer = (value == "true");
                    } else if (attr == "windowPositionX") {
                        windowPosition.x = atoi(value.c_str());
                    } else if (attr == "windowPositionY") {
                        windowPosition.y = atoi(value.c_str());
                    } else if (attr == "windowSizeWidth") {
                        windowSize.SetWidth(atoi(value.c_str()));
                    } else if (attr == "windowSizeHeight") {
                        windowSize.SetHeight(atoi(value.c_str()));
                    }                    
                }
            }
        }
        catch (const XMLParseError& e) {
            throw ConfigurationError(
                "Error reading server configuration: " + std::string(e.what()));
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
        
        fprintf(file, "<server-configuration>\n");
        writeAttr(file, "serverPort", serverPort);
        writeAttr(file, "shouldStartServer", shouldStartServer);
        writeAttr(file, "windowPositionX", windowPosition.x);
        writeAttr(file, "windowPositionY", windowPosition.y);
        writeAttr(file, "windowSizeWidth", windowSize.GetWidth());
        writeAttr(file, "windowSizeHeight", windowSize.GetHeight());
        fprintf(file, "</server-configuration>\n");
        
        fclose(file);
    }

}
