#ifndef PYR_MAP_VIEW_H
#define PYR_MAP_VIEW_H


#include <gmtl/gmtl.h>
#include "MapFile.h"
#include "Utility.h"
#include "wx.h"


namespace pyr {

    class MainFrame;
    class Texture;
    class Tool;
    
    class MapView : public wxGLCanvas {
    public:
        MapView(wxWindow* parent, MainFrame* mainFrame);
        ~MapView();

        const Map* getMap() const;
        
        void setTool(Tool* tool);
        Tool* getTool() const;
        
        void setViewCenter(const gmtl::Vec2f& center) { _viewCenter = center; }        
        const gmtl::Vec2f& getViewCenter() const      { return _viewCenter;   }
        gmtl::Vec2f& getViewCenter()                  { return _viewCenter;   }
        
        void setZoomFactor(float factor) { _zoomFactor = factor; }
        float getZoomFactor() const      { return _zoomFactor; }

    private:
        void OnSize(wxSizeEvent& e);
        void OnEraseBackground(wxEraseEvent& e);
        void OnPaint(wxPaintEvent& e);
        void OnMouseEvent(wxMouseEvent& e);
        
        void draw();

        MainFrame* _mainFrame;
        ScopedPtr<Tool> _tool;
        gmtl::Vec2f _viewCenter;
        float _zoomFactor;

        DECLARE_EVENT_TABLE()
    };

}


#endif
