#ifndef PYR_RENDERER_H
#define PYR_RENDERER_H

#include "Types.h"

namespace pyr {
    class Model;

    class Renderer {
    protected:
        template <class Shader>
        static void renderMesh(Model& model,Shader shader);
    public:
        virtual ~Renderer(){}
        virtual void draw(Model*)=0;
        virtual void useVertexArrays(bool)=0;
    };

    class DefaultRenderer : public Renderer {
        bool _useVertexArrays;
    public:
        DefaultRenderer();

        virtual void draw(Model* m);
        virtual void useVertexArrays(bool b);
    };

    class CellShadeRenderer : public Renderer {
        struct ShadeTex {
            u32 handle;
            ShadeTex();
            ~ShadeTex();
        } _shadeTex;

        bool _useVertexArrays;
    public:

        CellShadeRenderer();

        virtual void draw(Model* m);
        virtual void useVertexArrays(bool b);
    };
}

#endif
