
#include "AddRectCommand.h"

namespace pyr {
    AddRectCommand::AddRectCommand(float x, float y, float width, float height, const std::string& fileName) 
        : _image(x, y, width, height, fileName)
    {
    }

    bool AddRectCommand::perform(MapFile* map) {
        map->_terrain.rects.push_back(_image);
        return true;
    }

    bool AddRectCommand::undo(MapFile* map) {
        // We assume that the undo/redo stack is never interrupted in any way
        // thus this is the only change we have to deal with. (all the others
        // that may throw this off have been undone)
        map->_terrain.rects.pop_back();
        return true;
    }
}
