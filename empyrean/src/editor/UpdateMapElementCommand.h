#ifndef PYR_UPDATEMAPELEMENTCOMMAND_H
#define PYR_UPDATEMAPELEMENTCOMMAND_H

#include <gmtl/Vec.h>
#include "Command.h"

namespace pyr {

    class MapElement;
    
    class UpdateMapElementCommand : public Command {
    public:

        UpdateMapElementCommand(MapElement* element, gmtl::Vec2f& newPos);

        virtual void perform(CommandContext* context);
        virtual void undo(CommandContext* context);

    private:
        MapElement* _element;
        gmtl::Vec2f _newPos;
        gmtl::Vec2f _oldPos;
    };

}

#endif