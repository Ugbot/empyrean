#ifndef PYR_RENDERER_H
#define PYR_RENDERER_H

#include "Types.h"

namespace pyr {
    class Model;

    struct Renderer
    {
        virtual ~Renderer(){}
        virtual void draw(Model&)=0;
    };

    class DefaultRenderer : public Renderer
    {
    public:
        virtual void draw(Model& m);
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

        virtual void draw(Model& m);
    };
};

#endif