#include "Map.h"
#include "MapVisitor.h"


namespace pyr {

    class MapEnumerator : public MapVisitor {
    public:
        MapEnumerator(std::vector<MapElementPtr>& elts) : _elts(elts) {
        }

        void visitGeometry(GeometryElement* e) {
            _elts.push_back(e);
        }

        void visitGroup(GroupElement* e) {
            _elts.push_back(e);
            for (size_t i = 0; i < e->children.size(); ++i) {
                e->children[i]->handleVisitor(*this);
            }
        }

        void visitDummy(DummyElement* e) {
            _elts.push_back(e);

        }

    private:
        std::vector<MapElementPtr>& _elts;
    };


    MapElementPtr Map::findElementByName(const std::string& name) const {
        std::vector<MapElementPtr> elts;
        getAllElements(elts);
        for (size_t i = 0; i < elts.size(); ++i) {
            if (elts[i]->name == name) {
                return elts[i];
            }
        }
        return 0;
    }

    void Map::getAllElements(std::vector<MapElementPtr>& elts) const {
        MapEnumerator v(elts);
        _root->handleVisitor(v);
    }

}
