#ifndef PYR_MAPRENDERER_H
#define PYR_MAPRENDERER_H

#include "MapVisitor.h"
#include "Utility.h"

namespace pyr {
    
    class MapRenderer : public MapVisitor {
    public:
        void drawWireframe(bool wireframe) {
            _wireframe = wireframe;
        }

        void drawNormals(bool normals) {
            _normals = normals;
        }

        virtual void visitGroup(GroupElement* e);
        virtual void visitGeometry(GeometryElement* e);

    private:
        Inited<bool, false> _wireframe;
        Inited<bool, false> _normals;
    };

}

#endif
