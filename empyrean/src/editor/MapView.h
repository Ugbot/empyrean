#ifndef PYR_MAP_VIEW_H
#define PYR_MAP_VIEW_H


#include "MapFile.h"
#include "Tool.h"
#include "Utility.h"
#include "wx.h"

namespace pyr {

    class MainFrame;
    class Texture;
    
    class MapView : public wxGLCanvas {
    public:
        MapView(wxWindow* parent, MainFrame* mainFrame);
        ~MapView();

        const Map* getMap() const;
        
        void setTool(Tool* tool);
        Tool* getTool() const;

        // Screw it.  Any class that can actually get to this class potentially needs to use these anyway.
        void OnSize(wxSizeEvent& e);
        void OnEraseBackground(wxEraseEvent& e);
        void OnPaint(wxPaintEvent& e);
        void OnMouseEvent(wxMouseEvent& e);
        
        void draw();
        //void drawRect(const Map::Rect* rect);

    private:

        MainFrame* _mainFrame;
        ScopedPtr<Tool> _tool;

        Texture* _testTex;
    
        DECLARE_EVENT_TABLE()
    };

}


#endif
