
#include "UpdateGeometryElementCommand.h"
#include "MapElement.h"

namespace pyr {

    UpdateGeometryElementCommand::UpdateGeometryElementCommand(
        GeometryElement* element, const gmtl::Vec2f& pos, const std::string& texture)
        : _element(element)
        , _pos(pos)
        , _texture(texture)
    {}

    void UpdateGeometryElementCommand::perform(CommandContext& context) {
        gmtl::Vec2f bleagh;
        std::string blarg;

        bleagh = _element->pos;
        blarg  = _element->texture;
        _element->pos = _pos;
        _element->texture = _texture;
        _pos = bleagh;
        _texture = blarg;
    }

    void UpdateGeometryElementCommand::undo(CommandContext& context) {
        // perform() does a swap, so we get to take a shortcut.
        perform(context);
    }

}
