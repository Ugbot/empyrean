#include "AddObstructionSegmentCommand.h"
#include "MapFile.h"

namespace pyr {
    AddObstructionSegmentCommand::AddObstructionSegmentCommand(int a, int b)
        : _p1(a)
        , _p2(b)
    {}

    bool AddObstructionSegmentCommand::perform(MapFile* map) {
        map->_obstructions.obstructions.push_back(MapFile::Obstruction(_p1, _p2));
        return true;
    }

    bool AddObstructionSegmentCommand::undo(MapFile* map) {
        map->_obstructions.obstructions.pop_back();
        return true;
    }
}
