#ifndef PYR_VEC_MATH_H
#define PYR_VEC_MATH_H


#include <gmtl/gmtl.h>
#include <gmtl/Math.h>

namespace pyr {

    using gmtl::Math::PI;
    using gmtl::Math::PI_OVER_2;
    using gmtl::Math::PI_OVER_4;

    using gmtl::Vec2f;
    using gmtl::Vec3f;
    using gmtl::Vec4f;
    
    using gmtl::Vec2i;
    using gmtl::Vec3i;
    using gmtl::Vec4i;

    inline void rotateVector(float angle, Vec2f& vec) {
        gmtl::Matrix22f rotMat;
        rotMat.set(gmtl::Math::cos(angle),gmtl::Math::sin(angle),
                   -gmtl::Math::sin(angle),gmtl::Math::cos(angle));
        
        // Calculate the velocity vectors of the two boxes in the collision coordinate system (collisionVec = new x axis)
        vec = rotMat * vec;
    }

}


#endif
