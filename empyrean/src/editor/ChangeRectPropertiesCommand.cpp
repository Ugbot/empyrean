
#include <algorithm>

#include "ChangeRectPropertiesCommand.h"

namespace pyr {
    ChangeRectPropertiesCommand::ChangeRectPropertiesCommand(int index, const MapFile::Rect& oldRect)
        : _index(index)
        , _rect(oldRect)
    {}

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setPosition(float x, float y) {
        _rect.x = x;
        _rect.y = y;
        return this;
    }

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setSize(float w, float h) {
        _rect.width = w;
        _rect.height = h;
        return this;
    }

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setX(float x) {
        _rect.x = x;
        return this;
    }

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setY(float y) {
        _rect.y = y;
        return this;
    }

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setZ(int z) {
        _rect.z = z;
        return this;
    }

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setWidth(float width) {
        _rect.width = width;
        return this;
    }

    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setHeight(float height) {
        _rect.height = height;
        return this;
    }
    ChangeRectPropertiesCommand* ChangeRectPropertiesCommand::setTextureName(const std::string& fileName) {
        _rect.name = fileName;
        return this;
    }

    bool ChangeRectPropertiesCommand::perform(MapFile* map) {
        std::swap(map->_terrain.rects[_index], _rect);
        return true;
    }

    bool ChangeRectPropertiesCommand::undo(MapFile* map) {
        return perform(map);
    }
}