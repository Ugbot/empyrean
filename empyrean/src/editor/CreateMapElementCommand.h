#ifndef PYR_CREATEMAPELEMENTCOMMAND_H
#define PYR_CREATEMAPELEMENTCOMMAND_H

#include "Command.h"
#include "MapElement.h"

namespace pyr {

    class CreateMapElementCommand : public Command {
    public:
        CreateMapElementCommand(
            const MapElementPtr& element,
            const GroupElementPtr& parentElement);

        virtual void perform(CommandContext& context);
        virtual void undo(CommandContext& context);

    private:
        MapElementPtr _element;
        GroupElementPtr _parentElement;
    };

}

#endif
