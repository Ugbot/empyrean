#ifndef PYR_MAP_VIEW_H
#define PYR_MAP_VIEW_H


#include "Map.h"
#include "Tool.h"
#include "wx.h"


namespace pyr {

    
    class MapView : public wxGLCanvas {
    public:
        MapView(wxWindow* parent, Tool* defaultTool);
        Map& getMap();
        
        void setTool(Tool* tool);
        Tool* getTool() const;
    
    private:
        void OnSize(wxSizeEvent& e);
        void OnEraseBackground(wxEraseEvent& e);
        void OnPaint(wxPaintEvent& e);
        void OnMouseEvent(wxMouseEvent& e);
        
        void draw();
        
        Map _map;
        ScopedPtr<Tool> _tool;
    
        DECLARE_EVENT_TABLE()
    };

}


#endif
