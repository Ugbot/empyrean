
#include "MapElement.h"
#include "MapVisitor.h"

namespace pyr {

    bool GeometryElement::Triangle::operator == (const GeometryElement::Triangle& rhs) const { 
        // There shouldn't be any repeat indices, so we can just see if there's
        // any commonality between each vertex
        return
            (vert[0] == rhs.vert[0] ||
             vert[0] == rhs.vert[1] ||
             vert[0] == rhs.vert[2]) &&
            (vert[1] == rhs.vert[0] ||
             vert[1] == rhs.vert[1] ||
             vert[1] == rhs.vert[2]) &&
            (vert[2] == rhs.vert[0] ||
             vert[2] == rhs.vert[1] ||
             vert[2] == rhs.vert[2]);
    }

    GeometryElement::GeometryElement()
        : vertices(_verts)
        , tris(_tris)
    {}

    void GeometryElement::addVert(
        const Vec2f& pos,
        const Vec2f& tex,
        const Vec4f& col)
    {
        Vertex v;
        v.pos = pos;
        v.tex = tex;
        v.col = col;

        _verts.push_back(v);
    }

    void GeometryElement::updateVert(
        unsigned index,
        const Vec2f& pos,
        const Vec2f& tex,
        const Vec4f& col)
    {
        Vertex& v = _verts[index];
        v.pos = pos;
        v.tex = tex;
        v.col = col;
    }

    void GeometryElement::deleteVert(unsigned index) {
        // TODO: update all the other triangle indeces and crap
        _verts.erase(_verts.begin() + index);
    }

    void GeometryElement::addTri(int a, int b, int c) {

        Triangle t;
        t.vert[0] = a;
        t.vert[1] = b;
        t.vert[2] = c;

        // Make sure the tri doesn't already exist in here someplace.
        // std::set instead?
        for (size_t i = 0; i < tris.size(); i++) {
            if (tris[i] == t) {
                return;
            }
        }

        _tris.push_back(t);
    }

    void GeometryElement::updateTri(unsigned index, int a, int b, int c) {
        Triangle& t = _tris[index];
        t.vert[0] = a;
        t.vert[1] = b;
        t.vert[2] = c;
    }

    void GeometryElement::deleteTri(unsigned index) {
        _tris.erase(_tris.begin() + index);
    }

    void GeometryElement::handleVisitor(MapVisitor& v) {
        v.visitGeometry(this);
    }
    
    void GroupElement::handleVisitor(MapVisitor& v) {
        v.visitGroup(this);
    }
}
