#ifndef PYR_MAP_VIEW_H
#define PYR_MAP_VIEW_H


#include "Map.h"
#include "Tool.h"
#include "Command.h"
#include "Utility.h"
#include "wx.h"

#include <stack>

namespace pyr {

    
    class MapView : public wxGLCanvas, public CommandReciever {
    public:
        MapView(wxWindow* parent, Tool* defaultTool);
        ~MapView();

        Map& getMap();
        
        void setTool(Tool* tool);
        Tool* getTool() const;

        virtual void handleCommand(Command* cmd);
        void undo();
        void redo();
    
    private:
        void OnSize(wxSizeEvent& e);
        void OnEraseBackground(wxEraseEvent& e);
        void OnPaint(wxPaintEvent& e);
        void OnMouseEvent(wxMouseEvent& e);
        
        void draw();
       
        Map _map;
        ScopedPtr<Tool> _tool;

        std::stack<Command*> _undoList;
        std::stack<Command*> _redoList;
        void clearList(std::stack<Command*>& list); // deletes and clears
    
        DECLARE_EVENT_TABLE()
    };

}


#endif
