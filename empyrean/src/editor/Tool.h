#ifndef PYR_TOOL_H
#define PYR_TOOL_H

#include <map>
#include <string>

namespace pyr {

    class MainFrame;
    class MapView;
    class MapFile;
    class CommandReciever;

    struct ToolEvent {
        CommandReciever* cmd;
        float x;
        float y;
        bool shift;
        bool ctrl;
        bool alt;
    };

    /**
     * Superclass for all editor tools.
     * This is *almost* an interface; it also includes a reference to the MapView that owns the tool,
     * and allows tools to gain a const MapView* pointing to it.
     *
     * This is necessary for tools to be able to render things when active, and other such things.
     * the constness *should* keep silly people from altering the map without using a Command.
     * (shame on you for trying)
     */
    class Tool {
    public:
        Tool(MainFrame* mf);  // necessary -_-
        virtual ~Tool() { }
        
        virtual bool onMouseMove(ToolEvent&) { return false; }
        virtual bool onLeftDown(ToolEvent&)  { return false; }
        virtual bool onLeftUp(ToolEvent&)    { return false; }
        virtual bool onPropertiesChanged(const std::string& name, const std::string& value) { return false; }

        virtual void onRender(){}

    protected:
        MainFrame* getMainFrame() const;
        //MapView* getMapView() const;
        const MapFile* getMap() const;

        void setPropertiesGrid(std::map<std::string, std::string>& properties);

    private:
        MainFrame* _mainFrame;
    };

}


#endif
