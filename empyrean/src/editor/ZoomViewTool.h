#ifndef PYR_ZOOM_VIEW_TOOL_H
#define PYR_ZOOM_VIEW_TOOL_H


#include "Tool.h"


namespace pyr {

    class ZoomViewTool : public Tool {
    public:
        ZoomViewTool() {
            _down = false;
        }
        
        bool onMouseMove(ToolEvent& event) {
            if (_down) {
                float factor = float(pow(1.01, _lastY - event.screenPos[1]));
                getMapView()->setZoomFactor(_zoomFactor * factor);
                return true;
            } else {
                return false;
            }
        }
        
        bool onLeftDown(ToolEvent& event) {
            _down = true;
            _lastY = event.screenPos[1];
            _zoomFactor = getMapView()->getZoomFactor();
            return false;
        }
        
        bool onLeftUp(ToolEvent& event) {
            _down = false;
            return false;
        }
        
    private:
        bool _down;
        int _lastY;
        float _zoomFactor;
    };

}


#endif
