
#include "MapUpdateVisitor.h"
#include "Editor.h"
#include "MainFrame.h"
#include "UpdateMapElementCommand.h"
#include "UpdateGeometryElementCommand.h"

namespace pyr {

    MapUpdateVisitor::MapUpdateVisitor(const std::string& property, const std::string& newValue)
        : _property(property)
        , _newValue(newValue)
    {}

    void MapUpdateVisitor::visitGeometry(GeometryElement* e) {
        std::string tex(e->material ? e->material->texture : "");
        gmtl::Vec2f newPos(e->pos);

        if (_property == "x") {
            newPos[0] = atof(_newValue.c_str());
        } else if (_property == "y") {
            newPos[1] = atof(_newValue.c_str());
        } else if (_property == "Texture") {
            tex = _newValue;
        }

        Editor::getMainFrame()->handleCommand(
            new UpdateGeometryElementCommand(e, newPos, tex));
    }

    void MapUpdateVisitor::visitGroup(GroupElement* e) {
        gmtl::Vec2f newPos(e->pos);

        if (_property == "x") {
            newPos[0] = atof(_newValue.c_str());
        } else if (_property == "y") {
            newPos[1] = atof(_newValue.c_str());
        }

        Editor::getMainFrame()->handleCommand(
            new UpdateMapElementCommand(e, newPos)
            );
    }

}
