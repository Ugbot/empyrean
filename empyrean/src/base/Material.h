#ifndef PYR_MATERIAL_H
#define PYR_MATERIAL_H


#include <string>
#include "RefCounted.h"
#include "RefPtr.h"
#include "VecMath.h"


namespace pyr {

    class Material : public RefCounted {
    protected:
        ~Material() {
        }

    public:
        Material() {
            diffuse = Vec3f(1, 1, 1);
            texture_scale = Vec2f(1, 1);
        }

        Vec3f diffuse;
        std::string texture;
        Vec2f texture_offset;
        Vec2f texture_scale;
    };
    PYR_REF_PTR(Material);

}


#endif
