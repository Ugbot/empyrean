#include <sstream>
#include "Map.h"
#include "MapElement.h"
#include "MapLoader.h"
#include "OBJLoader.h"
#include "PathHandler.h"
#include "ScopedPtr.h"
#include "XMLParser.h"


namespace pyr {

    void loadMetaData(MapPtr map, PathHandler& ph, const std::string& filename) {
        ScopedPtr<XMLNode> metaroot;

        try {
            metaroot = parseXMLFile(ph.findFile(filename));
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
                    std::istringstream ss(sceneNode->getAttr("position"));
                    float x, y, z;
                    if (ss >> x >> y >> z) {
                        // 3ds max to Empyrean coordinate change.
                        elt->pos = Vec2f(x, y);
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

    MapPtr loadMap(const std::string& filename) {
        PathHandler ph;
        ScopedPathSearch sps(ph, getPath(filename));

        ScopedPtr<XMLNode> maproot;
        try {
            maproot = parseXMLFile(filename);
            if (!maproot) {
                PYR_THROW(LoadMapError, "Map " << filename << " is empty.  (parseXMLFile returned null.)");
            }

            if (maproot->getName() != "pyrmap") {
                PYR_THROW(LoadMapError, filename << " is not an Empyrean map file.");
            }
        }
        catch (const XMLParseError& e) {
            PYR_THROW(LoadMapError, "Couldn't load map " << filename << ": " << e.what());
        }

        MapPtr result = new Map;

        for (size_t i = 0; i < maproot->getChildCount(); ++i) {
            XMLNode* child = maproot->getChild(i);

            if (child->getName() == "geometry") {
                string obj_filename = child->getAttr("file");
                MapElementPtr elt = loadOBJFile(ph.findFile(obj_filename));
                if (!elt) {
                    PYR_THROW(LoadMapError, "Can't load " << obj_filename << " referenced by " << filename);
                }

                if (child->hasAttr("scale")) {
                    float scale = static_cast<float>(atof(child->getAttr("scale").c_str()));
                    GroupElementPtr group = new GroupElement;
                    group->scale = scale;
                    group->addChild(elt);
                    elt = group;
                }

                result->addElement(elt);

                if (child->hasAttr("meta")) {
                    loadMetaData(result, ph, child->getAttr("meta"));
                }
            }
        }

        return result;
    }

}
