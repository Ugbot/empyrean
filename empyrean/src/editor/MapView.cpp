#include <stdlib.h>
#include "GLUtility.h"
#include "MainFrame.h"
#include "MapOutliner.h"
#include "MapRenderer.h"
#include "MapView.h"
#include "Texture.h"
#include "Tool.h"
#include "TranslateViewTool.h"


namespace pyr {

    BEGIN_EVENT_TABLE(MapView, wxGLCanvas)
        EVT_SIZE(MapView::OnSize)
        EVT_ERASE_BACKGROUND(MapView::OnEraseBackground)
        EVT_PAINT(MapView::OnPaint)
        
        EVT_LEFT_DOWN (MapView::OnMouseEvent)
        EVT_LEFT_UP   (MapView::OnMouseEvent)
        EVT_RIGHT_DOWN(MapView::OnMouseEvent)
        EVT_RIGHT_UP  (MapView::OnMouseEvent)
        EVT_MOTION    (MapView::OnMouseEvent)
    END_EVENT_TABLE()
    

    MapView::MapView(wxWindow* parent, MainFrame* mainFrame)
        : wxGLCanvas(parent, -1)
        , _mainFrame(mainFrame)
    {
        typedef TranslateViewTool DefaultTool;

        _tool = new DefaultTool;
        _zoomFactor = 100.0f;
    }

    MapView::~MapView() {
    }

    const Map* MapView::getMap() const {
        return _mainFrame->getMap();
    }

    void MapView::setTool(Tool* tool) {
        PYR_ASSERT(tool, "No tool passed to setTool");
        _tool = tool;
        Refresh();
    }

    Tool* MapView::getTool() const {
        return _tool.get();
    }
    
    Vec2f MapView::getMapCoordinates(const Vec2i& screenPos) {
        wxSize size = GetClientSize();
        Vec2f upperLeft(  // In map coordinates.
            _viewCenter[0] - size.x / 2.0f / _zoomFactor,
            _viewCenter[1] + size.y / 2.0f / _zoomFactor);
        return Vec2f(
            upperLeft[0] + screenPos[0] / _zoomFactor,
            upperLeft[1] - screenPos[1] / _zoomFactor);
    }
    
    Vec2i MapView::getScreenCoordinates(const Vec2f& mapPos) {
        wxSize size = GetClientSize();
        Vec2f screenPos(
            _zoomFactor * (mapPos[0] - _viewCenter[0]) + size.x / 2.0f,
            _zoomFactor * (_viewCenter[1] - mapPos[1]) + size.y / 2.0f);
        return Vec2i(
            static_cast<int>(screenPos[0]),
            static_cast<int>(screenPos[1]));
    }

    void MapView::OnSize(wxSizeEvent& e) {
        wxGLCanvas::OnSize(e);
        
        // set GL viewport (not called by wxGLCanvas::OnSize on all platforms)
        int w, h;
        GetClientSize(&w, &h);
        if (GetContext()) {
            SetCurrent();
            glViewport(0, 0, w, h);
        }
    }

    void MapView::OnEraseBackground(wxEraseEvent& e) {
        // avoid flicker by doing nothing
    }

    void MapView::OnPaint(wxPaintEvent& e) {
        wxPaintDC dc(this);

        if (!GetContext()) {
            return;
        }
        SetCurrent();

        draw();
        SwapBuffers();
    }

    void MapView::OnMouseEvent(wxMouseEvent& e) {
        wxSize size = GetClientSize();
        if (size.GetX() == 0 || size.GetY() == 0) {
            return;
        }
        
        const Vec2i screenPos(e.GetX(), e.GetY());
    
        ToolEvent te;
        te.cmd = _mainFrame;
        te.mapPos = getMapCoordinates(screenPos);
        te.screenPos = screenPos;
        te.leftButton = e.LeftIsDown();
        te.rightButton = e.RightIsDown();
        te.middleButton = e.MiddleIsDown();
        te.shift = e.ShiftDown();
        te.ctrl = e.ControlDown();
        te.alt = e.AltDown();
    
        bool repaint = false;
        
        int button = e.GetButton();
        
        if (button == -1) {
            repaint = _tool->onMouseMove(te);
        } else if (button == 1) {
            if (e.ButtonDown()) {
                repaint = _tool->onLeftDown(te);
            } else {
                repaint = _tool->onLeftUp(te);
            }
        } else if (button == 3) {
            if (e.ButtonDown()) {
                repaint = _tool->onRightDown(te);
            } else {
                repaint = _tool->onRightUp(te);
            }
        }
        
        if (repaint) {
            Refresh();
        }
    }

    void MapView::draw() {
        // Use these to determine the projection.
        int w, h;
        GetClientSize(&w, &h);
    
        const float mapViewX = w / _zoomFactor;
        const float mapViewY = h / _zoomFactor;
        setOrthoProjection(mapViewX, mapViewY, true);
        glTranslatef(mapViewX / 2 - _viewCenter[0],
                     mapViewY / 2 - _viewCenter[1], 0);
    
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

        MapRenderer renderer;
        getMap()->handleVisitor(renderer);

        MapOutliner outliner;
        getMap()->handleVisitor(outliner);

        _tool->onRender();
        
        // draw origin
        glBegin(GL_LINES);
        glColor3f(1, 0, 0); glVertex2f(-1,  0); glVertex2f(1, 0);
        glColor3f(0, 1, 0); glVertex2f( 0, -1); glVertex2f(0, 1);
        glEnd();
    }
}
