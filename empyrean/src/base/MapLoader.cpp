#include <sstream>
#include "Map.h"
#include "MapElement.h"
#include "MapLoader.h"
#include "OBJLoader.h"
#include "ScopedPtr.h"
#include "XMLParser.h"


namespace pyr {

    void loadMetaData(Map* map, const std::string& filename) {
        ScopedPtr<XMLNode> metaroot;

        try {
            metaroot = parseXMLFile(filename);
            if (!metaroot) {
                return;
            }

            if (metaroot->getName() != "map-metadata") {
                return;
            }
        }
        catch (const XMLParseError&) {
            return;
        }

        for (size_t i = 0; i < metaroot->getChildCount(); ++i) {
            XMLNode* sceneNode = metaroot->getChild(i);
            if (sceneNode->getName() == "node") {
                std::string nodeName = sceneNode->getAttr("name");
                MapElementPtr elt = map->findElementByName(nodeName);
                if (!elt) {
                    // Create a dummy element for the purpose of holding
                    // properties.
                    elt = new DummyElement;
                    map->addElement(elt);
                    elt->name = nodeName;

                    // Only set position for elements that aren't already in the map.
                    std::stringstream ss(sceneNode->getAttr("position"));
                    float x, y, z;
                    if (ss >> x >> y >> z) {
                        // 3ds max to Empyrean coordinate change.
                        elt->pos = Vec2f(x, z);
                    }
                }

                // Add properties to the map element.
                for (size_t i = 0; i < sceneNode->getChildCount(); ++i) {
                    XMLNode* propNode = sceneNode->getChild(i);
                    if (propNode->getName() == "property") {
                        elt->addProperty(
                            propNode->getAttr("key"),
                            propNode->getAttr("value"));
                    }
                }
            }
        }
    }

    Map* loadMap(const std::string& filename) {
        Map* map = loadOBJFile(filename);
        if (!map) {
            return 0;
        }

        loadMetaData(map, filename + ".meta");
        return map;
    }

}
