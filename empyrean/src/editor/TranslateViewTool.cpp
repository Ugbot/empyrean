#include "MapView.h"
#include "TranslateViewTool.h"


namespace pyr {

    TranslateViewTool::TranslateViewTool() {
        _down = false;
    }

    bool TranslateViewTool::onMouseMove(ToolEvent& event) {
        if (_down) {
            getMapView()->getViewCenter() += _lastPos - event.mapPos;
            _lastPos = getMapView()->getMapCoordinates(event.screenPos);
            return true;
        } else {
            return false;
        }
    }
    
    bool TranslateViewTool::onLeftDown(ToolEvent& event) {
        _lastPos = event.mapPos;
        _down = true;
        return false;
    }
    
    bool TranslateViewTool::onLeftUp(ToolEvent& event) {
        _down = false;
        return false;
    }
        
}
