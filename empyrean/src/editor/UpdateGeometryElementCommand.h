
#ifndef PYR_UPDATEGEOMETRYELEMENTCOMMAND_H
#define PYR_UPDATEGEOMETRYELEMENTCOMMAND_H

#include <string>
#include <gmtl/Vec.h>
#include "Command.h"

namespace pyr {

    class GeometryElement;

    /**
     * Updates a geometry element.  This does *not* handle altering the 
     * geometric properties (ie the points and triangles), only the global
     * properties that show up in the property grid.  Currently, this is
     * only the texture, and the position.
     */
    class UpdateGeometryElementCommand : public Command {
    public:

        UpdateGeometryElementCommand(GeometryElement* element, const gmtl::Vec2f& pos, const std::string& texture);

        virtual void perform(CommandContext* context);
        virtual void undo(CommandContext* context);

    private:

        // These hold either the old, or the new texture/position.  perform() and undo() swap these with the values already in the element
        gmtl::Vec2f _pos;
        std::string _texture;

        GeometryElement* _element;
    };
}

#endif