#ifndef PYR_CHANGERECTPROPERTIESCOMMAND_H
#define PYR_CHANGERECTPROPERTIESCOMMAND_H

#include "Command.h"
#include "MapFile.h"

namespace pyr {
    /**
     * A command to tweak a map rect in some way.  The length 
     * of the name alone makes this cumbersome to work with. -_-
     */
    class ChangeRectPropertiesCommand : public Command {
    public:
        ChangeRectPropertiesCommand(int index, const MapFile::Rect& oldRect);

        // All of these return self references.
        // They're meant to make the constructor bit a bit more readable
        // Don't use these after the initial construction.  Weirdness may 
        // occur, depending on whether the command has been undone or not.
        ChangeRectPropertiesCommand* setPosition(float x, float y);
        ChangeRectPropertiesCommand* setSize(float w, float h);
        ChangeRectPropertiesCommand* setX(float x);
        ChangeRectPropertiesCommand* setY(float y);
        ChangeRectPropertiesCommand* setZ(int z);
        ChangeRectPropertiesCommand* setWidth(float w);
        ChangeRectPropertiesCommand* setHeight(float h);
        ChangeRectPropertiesCommand* setTextureName(const std::string& fileName);

        virtual bool perform(MapFile* map);
        virtual bool undo(MapFile* map);

    private:
        int _index;
        MapFile::Rect _rect;
    };
}

#endif
