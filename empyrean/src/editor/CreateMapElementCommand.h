#ifndef PYR_CREATEMAPELEMENTCOMMAND_H
#define PYR_CREATEMAPELEMENTCOMMAND_H

#include "Command.h"
#include "Utility.h"
#include "MapElement.h"

namespace pyr {

    class CreateMapElementCommand : public Command {
    public:
        CreateMapElementCommand(const RefPtr<MapElement>& element, const RefPtr<GroupElement>& parentElement);

        virtual void perform(CommandContext* context);
        virtual void undo(CommandContext* context);

    private:
        RefPtr<MapElement> _element;
        RefPtr<GroupElement> _parentElement;
    };

}

#endif