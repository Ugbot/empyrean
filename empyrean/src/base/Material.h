#ifndef PYR_MATERIAL_H
#define PYR_MATERIAL_H


#include <string>
#include "RefCounted.h"


namespace pyr {

    class Material : public RefCounted {
    protected:
        ~Material() { }

    public:
        std::string texture;
    };
    typedef RefPtr<Material> MaterialPtr;

}


#endif
