#ifndef PYR_TRANSLATE_TOOL_H
#define PYR_TRANSLATE_TOOL_H


#include "Tool.h"
#include "UpdateMapElementCommand.h"

namespace pyr {

    /**
     * Tool used to translate (ie move) map elements around.
     *
     * I'm a bad, bad man; TranslateTool cheats by moving the element
     * around without using commands.  This is done purely for UI reasons,
     * as the element is visibly moved around the map as the user drags the
     * mouse.  When the drag is done, the command interface is used, so that
     * undo/redo perform normally.
     */
    class TranslateTool : public Tool {
    public:
        TranslateTool()
            : _down(false)
        {}

        virtual bool onMouseMove(ToolEvent& event) {
            if (_down) {
                if (MapElement* elt = getSelectedElement()) {
                    elt->pos = _oldElementPos - (_lastPos - event.mapPos);
                }
            }

            return _down;
        }

        virtual bool onLeftDown(ToolEvent& event) {
            if (MapElement* elt = getSelectedElement()) {
                _oldElementPos = elt->pos;
                _down = true;
                _lastPos = event.mapPos;
            }            
            return false;
        }

        virtual bool onLeftUp(ToolEvent& event) {
            _down = false;
            Vec2f newPos = _oldElementPos - (_lastPos - event.mapPos);

            if (MapElement* elt = getSelectedElement()) {
                // need to restore this; permanently altering the map
                // must be done with a Command
                elt->pos = _oldElementPos;

                // if shift is held when the mouse button is released, no
                // movement is done
                if (!event.shift) {
                    event.cmd->handleCommand(new UpdateMapElementCommand(elt, newPos));
                }

                getMainFrame()->updatePropertyGrid();

                return true;
            } else {
                return false;
            }
        }

    private:
        bool _down;
        Vec2f _lastPos;

        Vec2f _oldElementPos;
    };

}


#endif
