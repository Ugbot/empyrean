#ifndef PYR_RENDERER_H
#define PYR_RENDERER_H

#include "Types.h"

namespace pyr {
    class Model;

    class Renderer
    {
    public:
        virtual ~Renderer(){}
        virtual void draw(Model*)=0;

        static void begin2D();
        static void end2D();

        static void begin3D() { end2D();   }
        static void end3D()   { begin2D(); }
    };

    class DefaultRenderer : public Renderer
    {
    public:
        virtual void draw(Model* m);
    };

    class CellShadeRenderer : public Renderer
    {
        struct ShadeTex {
            u32 handle;
            ShadeTex();
            ~ShadeTex();
        } _shadeTex;
    public:

        CellShadeRenderer();

        virtual void draw(Model* m);
    };
};

#endif