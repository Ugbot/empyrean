#ifndef PYR_MODEL_RENDERER_H
#define PYR_MODEL_RENDERER_H

namespace pyr {

    class Model;

    class ModelRenderer {
    public:
        void draw(const Model& m);

    private:
        void renderMesh(const Model& model);
    };

}

#endif
