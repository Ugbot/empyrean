#ifndef PYR_MODEL_RENDERER_H
#define PYR_MODEL_RENDERER_H

namespace pyr {

    class Model;

    class ModelRenderer {
    public:
        static void draw(const Model& m);

    private:
        static void renderMesh(const Model& model);
    };

}

#endif
