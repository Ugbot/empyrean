
#include "AddImageCommand.h"

namespace pyr {
    AddImageCommand::AddImageCommand(float x, float y, float width, float height, const std::string& fileName) 
        : _image(x, y, width, height, fileName)
    {
    }

    bool AddImageCommand::perform(Map* map) {
        map->_terrain.images.push_back(_image);
        return true;
    }

    bool AddImageCommand::undo(Map* map) {
        // We assume that the undo/redo stack is never interrupted in any way
        // thus this is the only change we have to deal with. (all the others
        // that may throw this off have been undone)
        map->_terrain.images.pop_back();
        return true;
    }
}