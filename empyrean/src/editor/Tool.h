#ifndef PYR_TOOL_H
#define PYR_TOOL_H


namespace pyr {

    class Map;
    

    struct ToolEvent {
        Map* map;
        float x;
        float y;
    };

    class Tool {
    public:
        virtual ~Tool() { }
        
        virtual bool onMouseMove(ToolEvent&) { return false; }
        virtual bool onLeftDown(ToolEvent&)  { return false; }
        virtual bool onLeftUp(ToolEvent&)    { return false; }
    };

}


#endif
