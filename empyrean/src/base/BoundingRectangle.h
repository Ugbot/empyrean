#ifndef PYR_BOUNDING_RECTANGLE_H
#define PYR_BOUNDING_RECTANGLE_H


#include "VecMath.h"


namespace pyr {

    struct BoundingRectangle {
        BoundingRectangle() {
        }

        BoundingRectangle(const Vec2f& p1, const Vec2f& p2) {
            min[0] = std::min(p1[0], p2[0]);
            min[1] = std::min(p1[1], p2[1]);
            max[0] = std::max(p1[0], p2[0]);
            max[1] = std::max(p1[1], p2[1]);
        }

        float getWidth() const {
            return max[0] - min[0];
        }
        
        float getHeight() const {
            return max[1] - min[1];
        }
                
        bool operator!=(const BoundingRectangle& rhs) const {
            return min != rhs.min && 
                   max != rhs.max;
        }

        bool intersects(const BoundingRectangle& other) const {
            for (int i = 0; i < 2; ++i) {
                if (min[i] > other.max[i] || max[i] < other.min[i]) {
                    return false;
                }
            }
            return true;
        }

        Vec2f min;
        Vec2f max;
    };

}


#endif
