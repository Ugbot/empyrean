
#ifndef PYR_ADDIMAGECOMMAND_H
#define PYR_ADDIMAGECOMMAND_H

#include <string>

#include "Command.h"
#include "MapFile.h"

namespace pyr {
    
    class MapFile;

    class AddImageCommand : public Command {
    public:
        AddImageCommand(float x, float y, float width, float height, const std::string& fileName = "");
        
        virtual bool perform(MapFile* map);
        virtual bool undo(MapFile* map);

    private:
        MapFile::Image _image;
    };
}

#endif