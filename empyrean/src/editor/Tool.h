#ifndef PYR_TOOL_H
#define PYR_TOOL_H

#include <map>
#include <string>
#include "Command.h"
#include "VecMath.h"

namespace pyr {

    class MainFrame;
    class Map;
    class MapView;

    struct ToolEvent {
        CommandReceiver* cmd;
        Vec2f mapPos;
        Vec2i screenPos;
        bool leftButton;
        bool rightButton;
        bool middleButton;
        bool shift;
        bool ctrl;
        bool alt;

        void handleCommand(Command* command) {
            cmd->handleCommand(command);
        }
    };

    struct GridEvent {
        CommandReceiver* cmd;
        std::string name;
        std::string value;
    };

    /**
     * Superclass for all editor tools.
     * It allows tools to gain a const Map* pointing to it.
     *
     * This is necessary for tools to be able to render things when active, and other such things.
     * the constness *should* keep silly people from altering the map without using a Command.
     * (shame on you for trying)
     */
    class Tool {
    public:
        virtual ~Tool() { }
        
        virtual bool onMouseMove(ToolEvent&) { return false; }
        virtual bool onLeftDown(ToolEvent&)  { return false; }
        virtual bool onLeftUp(ToolEvent&)    { return false; }
        virtual bool onRightDown(ToolEvent&) { return false; }
        virtual bool onRightUp(ToolEvent&)   { return false; }
        virtual bool onPropertiesChanged(GridEvent&) { return false; }

        virtual void onRender() { }

    protected:
        static MainFrame* getMainFrame();
        static MapView* getMapView();
        static const Map* getMap();
        static MapElement* getSelectedElement();

        //static void setPropertiesGrid(std::map<std::string, std::string>& properties);
    };

}


#endif
