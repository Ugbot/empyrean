#ifndef PYR_MAP_VIEW_H
#define PYR_MAP_VIEW_H


#include "Map.h"
#include "ScopedPtr.h"
#include "VecMath.h"
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
        
        void setViewCenter(const Vec2f& center) { _viewCenter = center; }        
        const Vec2f& getViewCenter() const      { return _viewCenter;   }
        Vec2f& getViewCenter()                  { return _viewCenter;   }
        
        void setZoomFactor(float factor) { _zoomFactor = factor; }
        float getZoomFactor() const      { return _zoomFactor; }
        
        Vec2f getMapCoordinates(const Vec2i& screenPos);
        Vec2i getScreenCoordinates(const Vec2f& mapPos);
        

    private:
        void OnSize(wxSizeEvent& e);
        void OnEraseBackground(wxEraseEvent& e);
        void OnPaint(wxPaintEvent& e);
        void OnMouseEvent(wxMouseEvent& e);
        
        void draw();

        MainFrame* _mainFrame;
        ScopedPtr<Tool> _tool;
        Vec2f _viewCenter;
        float _zoomFactor;

        DECLARE_EVENT_TABLE()
    };

}


#endif
