#ifndef PYR_TOOL_H
#define PYR_TOOL_H


namespace pyr {

    class CommandReciever;

    struct ToolEvent {
        CommandReciever* cmd;
        float x;
        float y;
    };

    class Tool {
    public:
        virtual ~Tool() { }
        
        virtual bool onMouseMove(ToolEvent&) { return false; }
        virtual bool onLeftDown(ToolEvent&)  { return false; }
        virtual bool onLeftUp(ToolEvent&)    { return false; }

        virtual void onRender(){}

    private:
    };

}


#endif
