#ifndef PYR_MAP_H
#define PYR_MAP_H


#include <vector>
#include <string>
#include <map>


namespace pyr {

    /**
     * The storage-friendly representation of a map.
     *
     * Maps are comprised of a couple of disparate things.
     *
     * Images are just images.  The engine draws them, and that's about it.  There's no actual gameplay significance.
     *    Images have a z index, which determines which images are drawn above which.
     * Templates are named collections of images.  They're more complicated than images, but amount to pretty much the
     *    same thing.
     * Obstructions are line segments.  Entities can't cross these segments.
     * Entities are moving, breathing things.  They can do pretty much anything we want.
     * Triggers are invisible rectangles floating around space.  When they get touched, struck, or anything else we can
     *    forsee wanting, they can react by calling a script of some sort.
     *
     * There is no scene graph currently.  Maybe there should be.
     *
     */
    class MapFile {
    public:
        struct Rect {
            std::string name;
            float x, y;
            float width, height;
            int z;

            // TODO: u/v

            Rect() : x(0), y(0), width(0), height(0), z(0){}

            // It'd be awfully nice if C++ offered a way to do this automatically. >_>
            Rect(float _x, float _y, float _w, float _h, const std::string& _name = "", int _z = 0)
                : x(_x)
                , y(_y)
                , width(_w)
                , height(_h)
                , name(_name)
                , z(_z)
            {}
        };

        struct Template {
            std::string name;
            std::vector<Rect> rectangles;
        };

        struct Obstruction {
            int p1, p2;

            Obstruction() : p1(0), p2(0) {}
            Obstruction(int a, int b)
                : p1(a)
                , p2(b)
            {}
        };

        struct Point {
            float x, y;

            Point() : x(0), y(0){}

            Point(float _x, float _y)
                : x(_x)
                , y(_y)
            {}
        };

        struct ObstructionMap {
            std::vector<Point> points;
            std::vector<Obstruction> obstructions;
        };

        struct Entity {
            std::string behaviour;
            std::string model;
            Point position;
            //gmtl::Vec3f direction; // euler angle?  quat?
        };

        struct Trigger {
            float x, y;
            float width, height;
            std::string className;
        };

        // unimplemented as of now
        void save(const char* filename) const;
        void load(const char* filename);
        
        // Does this really belong here?  This seems like the sort of operation that belongs in a renderer class or somesuch.
        void draw();

        // add change listener?
    
    public: // I am a bad, bad man, and I know it.
    
        std::map<std::string, std::string> _metaData;
        struct Terrain {
            std::vector<Rect>     rects;
            std::vector<Template> templates;
        } _terrain;

        ObstructionMap            _obstructions;
        std::vector<Entity>       _entities;
        std::vector<Trigger>      _triggers;
    };
    
}


#endif
