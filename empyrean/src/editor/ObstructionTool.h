#ifndef PYR_OBSTRUCTIONTOOL_H
#define PYR_OBSTRUCTIONTOOL_H

#include "Tool.h"

namespace pyr {
    class ObstructionTool : public Tool {
    public:
        ObstructionTool(MainFrame* mf);

        virtual bool onLeftDown(ToolEvent& event);
        virtual void onRender();

    private:
        int _curPoint; // -1 if no point

        int nearestPoint(float x, float y);
        bool canAddPoint(int a, int b);
    };
}

#endif
