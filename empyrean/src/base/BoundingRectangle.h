#ifndef PYR_BOUNDING_RECTANGLE_H
#define PYR_BOUNDING_RECTANGLE_H


#include "VecMath.h"


namespace pyr {

    struct BoundingRectangle {
        BoundingRectangle() {
        }

        BoundingRectangle(Vec2f& p1, Vec2f& p2) {
            min[0] = std::min(p1[0], p2[0]);
            min[1] = std::min(p1[1], p2[1]);
            max[0] = std::max(p1[0], p2[0]);
            max[1] = std::max(p1[1], p2[1]);
        }

        Vec2f min;
        Vec2f max;
    };

}


#endif
