#include "AddObstructionPointCommand.h"
#include "MapFile.h"

namespace pyr {
    AddObstructionPointCommand::AddObstructionPointCommand(float x, float y)
        : _x(x)
        , _y(y)
    {
    }

    bool AddObstructionPointCommand::perform(MapFile* map) {
        map->_obstructions.points.push_back(MapFile::Point(_x, _y));
        return true;
    }

    bool AddObstructionPointCommand::undo(MapFile* map) {
        // We don't have to worry about any line segments using this point, simply because nothing else has
        // happened to the map at this point (it should have been undone if it has)
        map->_obstructions.points.pop_back();
        return true;
    }
}