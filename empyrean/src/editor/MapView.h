#ifndef PYR_MAP_VIEW_H
#define PYR_MAP_VIEW_H


#include "MapFile.h"
#include "Tool.h"
#include "Utility.h"
#include "wx.h"

namespace pyr {

    class MainFrame;
    
    class MapView : public wxGLCanvas {
    public:
        MapView(wxWindow* parent, MainFrame* mainFrame);
        ~MapView();

        const MapFile* getMap() const;
        
        void setTool(Tool* tool);
        Tool* getTool() const;

    private:
        void OnSize(wxSizeEvent& e);
        void OnEraseBackground(wxEraseEvent& e);
        void OnPaint(wxPaintEvent& e);
        void OnMouseEvent(wxMouseEvent& e);
        
        void draw();

        MainFrame* _mainFrame;
        ScopedPtr<Tool> _tool;
    
        DECLARE_EVENT_TABLE()
    };

}


#endif
