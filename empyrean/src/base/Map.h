#ifndef PYR_MAP_H
#define PYR_MAP_H


#include <vector>
#include "MapElement.h"


namespace pyr {

    class Map {
    public:
        // unimplemented as of now
        void save(const char* filename) const;
        void load(const char* filename);
        
        void draw();

        // add change listener?
    
        MapElement* getRoot();
        
        void addRectangle(float x1, float y1, float x2, float y2);
    
    private:
        struct Rectangle {
            float x1, y1;
            float x2, y2;
        };
    
        MapElementPtr _root;
        std::vector<Rectangle> _rectangles;
    };
    
    
    inline MapElement* Map::getRoot() {
        return _root.get();
    }
    
}


#endif
