
#ifndef PYR_ADDOBSTRUCTIONSEGMENTCOMMAND_H
#define PYR_ADDOBSTRUCTIONSEGMENTCOMMAND_H

#include "Command.h"

namespace pyr {
    class AddObstructionSegmentCommand : public Command {
    public:
        AddObstructionSegmentCommand(int a, int b);

        virtual bool perform(MapFile* map);
        virtual bool undo(MapFile* map);

    private:
        int _p1;
        int _p2;
    };
}

#endif
