#include <algorithm>
#include "UpdateGeometryElementCommand.h"
#include "MapElement.h"

namespace pyr {

    UpdateGeometryElementCommand::UpdateGeometryElementCommand(
        GeometryElement* element, const gmtl::Vec2f& pos, const std::string& texture)
        : _pos(pos)
        , _texture(texture)
        , _element(element)
    {}

    void UpdateGeometryElementCommand::perform(CommandContext& context) {
        std::swap(_element->pos,     _pos);
        //std::swap(_element->texture, _texture);
    }

    void UpdateGeometryElementCommand::undo(CommandContext& context) {
        // perform() does a swap, so we get to take a shortcut.
        perform(context);
    }

}
