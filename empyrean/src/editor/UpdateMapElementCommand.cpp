#include "UpdateMapElementCommand.h"
#include "MapView.h"
#include "MapElement.h"

namespace pyr {

    UpdateMapElementCommand::UpdateMapElementCommand(MapElement* element, gmtl::Vec2f& newPos)
        : _element(element)
        , _newPos(newPos)
    {}

    void UpdateMapElementCommand::perform(CommandContext* context) {
        _oldPos = _element->pos;
        _element->pos = _newPos;
        context->mapView->Refresh();
    }

    void UpdateMapElementCommand::undo(CommandContext* context) {
        _element->pos = _oldPos;
        context->mapView->Refresh();
    }

}