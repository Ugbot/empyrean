#ifndef PYR_ADDOBSTRUCTIONPOINTCOMMAND_H
#define PYR_ADDOBSTRUCTIONPOINTCOMMAND_H

#include "Command.h"

namespace pyr {
    class AddObstructionPointCommand : public Command {
    public:
        AddObstructionPointCommand(float x, float y);

        virtual bool perform(MapFile* map);
        virtual bool undo(MapFile* map);

    private:
        float _x;
        float _y;
    };
}

#endif