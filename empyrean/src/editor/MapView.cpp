#include <stdlib.h>
#include "MapView.h"
#include "Tool.h"
#include "MainFrame.h"
//#include "RectangleTool.h"
#include "Texture.h"

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
        //typedef RectangleTool DefaultTool;

        //_tool = new DefaultTool(_mainFrame);

        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

        _testTex = TexManager::instance().loadTex("images\\pointer.png");
    }

    MapView::~MapView() {
    }
    
    
    const Map* MapView::getMap() const {
        return _mainFrame->getMap();
    }
    
    
    void MapView::setTool(Tool* tool) {
        _tool = tool;
        Refresh();
    }
    
    Tool* MapView::getTool() const {
        return _tool.get();
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
    
        ToolEvent te;
        te.cmd = _mainFrame;
        te.x = float(e.GetX()) / size.x *  2 - 1;
        te.y = float(e.GetY()) / size.y * -2 + 1;
        te.leftButton = e.LeftIsDown();
        te.rightButton = e.RightIsDown();
        te.middleButton = e.MiddleIsDown();
        te.shift = e.ShiftDown();
        te.ctrl = e.ControlDown();
        te.alt = e.AltDown();
    
        bool repaint = false;
        
        int button = e.GetButton();
        
        if (button == -1) {
            //repaint = _tool->onMouseMove(te);
        } else if (button == 1) {
            if (e.ButtonDown()) {
                //repaint = _tool->onLeftDown(te);
            } else {
                //repaint = _tool->onLeftUp(te);
            }
        }
        
        if (repaint) {
            Refresh();
        }
    }
    
    void MapView::draw() {

        /*glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        const Map* map = getMap();

        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBindTexture(GL_TEXTURE_2D, _testTex->getHandle());
        glColor4f(1, 1, 1, 1);

        for (std::vector<Map::Rect>::const_iterator
            iter = map->_terrain.rects.begin();
            iter != map->_terrain.rects.end();
            iter++) {
            drawRect(&*iter);
        }

        glDisable(GL_TEXTURE_2D);

        // TODO: templates, obstructions, entities, et cetera

        glColor4f(1, 0, 0, 1);
        glBegin(GL_LINES);
        for (std::vector<Map::Obstruction>::const_iterator
            iter = map->_obstructions.obstructions.begin();
            iter != map->_obstructions.obstructions.end();
            iter++)
        {
            const Map::Point& p1 = map->_obstructions.points[iter->p1];
            const Map::Point& p2 = map->_obstructions.points[iter->p2];

            glVertex2f(p1.x, p1.y);
            glVertex2f(p2.x, p2.y);
        }
        glEnd();*/

        //_tool->onRender();
    }

    /*void MapView::drawRect(const Map::Rect* rect) {
        Texture* t = TexManager::instance().loadTex(rect->name);

        glBindTexture(GL_TEXTURE_2D, t->getHandle());
        glBegin(GL_QUADS);
        glTexCoord2f(0, 1); glVertex2f(rect->x, rect->y);
        glTexCoord2f(1, 1); glVertex2f(rect->x + rect->width, rect->y);
        glTexCoord2f(1, 0); glVertex2f(rect->x + rect->width, rect->y + rect->height);
        glTexCoord2f(0, 0); glVertex2f(rect->x, rect->y + rect->height);
        glEnd();
    }*/
}
