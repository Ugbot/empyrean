#ifndef PYR_MAPRENDERER_H
#define PYR_MAPRENDERER_H

#include "MapVisitor.h"
#include "Utility.h"
#include "VecMath.h"

namespace pyr {
    
    class MapRenderer : public MapVisitor {
    public:
        MapRenderer();

        void drawWireframe(bool wireframe) {
            _wireframe = wireframe;
        }

        void drawNormals(bool normals) {
            _normals = normals;
        }

        void setViewport(Vec2f ll, Vec2f ur) {
            _haveViewport = true;
            _lowerLeft = ll;
            _upperRight = ur;
        }

        virtual void visitGroup(GroupElement* e);
        virtual void visitGeometry(GeometryElement* e);

    private:
        Inited<bool, false> _wireframe;
        Inited<bool, false> _normals;
        
        Inited<bool, false> _haveViewport;
        Vec2f _lowerLeft;
        Vec2f _upperRight;

        Vec2f _currentPosition;
        float _currentScale;
    };

}

#endif
