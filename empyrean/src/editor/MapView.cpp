#include <stdlib.h>
#include "MapView.h"
#include "Tool.h"


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
    

    MapView::MapView(wxWindow* parent, Tool* defaultTool)
        : wxGLCanvas(parent, -1)
    {
        _tool = defaultTool;
    }

    MapView::~MapView() {
        clearList(_undoList);
        clearList(_redoList);
    }
    
    
    MapFile& MapView::getMap() {
        return _map;
    }
    
    
    void MapView::setTool(Tool* tool) {
        _tool = tool;
    }
    
    Tool* MapView::getTool() const {
        return _tool.get();
    }
    
    void MapView::handleCommand(Command* cmd) {
        clearList(_redoList);
        _undoList.push(cmd);
        bool refresh = cmd->perform(&_map);
        if (refresh) {
            Refresh();
        }
    }
    void MapView::undo() {
        if (!_undoList.empty()) {
            Command* c = _undoList.top();
            _undoList.pop();
            _redoList.push(c);
            bool refresh = c->undo(&_map);
            if (refresh) {
                Refresh();
            }
        }
    }

    void MapView::redo() {
        if (!_redoList.empty()) {
            Command* c = _redoList.top();
            _redoList.pop();
            _undoList.push(c);
            bool refresh = c->perform(&_map);
            if (refresh) {
                Refresh();
            }
        }
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
        te.cmd = this;
        te.x = float(e.GetX()) / size.x *  2 - 1;
        te.y = float(e.GetY()) / size.y * -2 + 1;
    
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
        }
        
        if (repaint) {
            Refresh();
        }
    }
    
#if 1
    void MapView::draw() {

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        for (std::vector<MapFile::Image>::iterator
            iter = _map._terrain.images.begin();
            iter != _map._terrain.images.end();
            iter++) {
            // glBindTexture
            glColor4f(1, 1, 1, 1);
            glBegin(GL_QUADS);
            glVertex2f(iter->x, iter->y);
            glVertex2f(iter->x + iter->width, iter->y);
            glVertex2f(iter->x + iter->width, iter->y + iter->height);
            glVertex2f(iter->x, iter->y + iter->height);
            glEnd();
        }

        // TODO: templates, obstructions, entities, et cetera
        _tool->onRender();
    }
#else
    void MapView::draw() {
        glClearColor(0, 0, 0, 0);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(-1, 1, -1, 1, 1, -1);
          
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
          
        // alpha blending
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        
        // point smoothing
        glEnable(GL_POINT_SMOOTH);
        glPointSize(4);
        
        // line smoothing
        glEnable(GL_LINE_SMOOTH);
        glLineWidth(2);
        
        glColor3f(1, 1, 1);
        glBegin(GL_POINTS);
        for (unsigned i = 0; i < 100; ++i) {
            float x = float(rand()) / RAND_MAX;
            float y = float(rand()) / RAND_MAX;
            glVertex2f(2 * x - 1, 2 * y - 1);
        }
        glEnd();
        
        glBegin(GL_LINE_STRIP);
        glColor3f(1, 1, 1); glVertex2f( 0,  0);
        glColor3f(1, 0, 0); glVertex2f( 1,  0);
        glColor3f(1, 1, 0); glVertex2f( 0,  1);
        glColor3f(0, 1, 0); glVertex2f(-1,  0);
        glColor3f(0, 0, 1); glVertex2f( 0, -1);
        glColor3f(1, 0, 0); glVertex2f( 1,  0);
        glEnd();
        
        glColor3f(0.5f, 0.5f, 0.5f);
        _map.draw();
    }
#endif

    void MapView::clearList(std::stack<Command*>& list) {
        while (!list.empty()) {
            Command* c = list.top();
            delete c;
            list.pop();
        }
    }
}
