#include "Map.h"
#include "MapVisitor.h"


namespace pyr {

    class MapSearcher : public MapVisitor {
    public:
        MapSearcher(const std::string& name) {
            _name = name;
        }

        // Ideally, these would halt the search once they've found something.

        void visitGeometry(GeometryElement* e) {
            if (e->name == _name) {
                result = e;
            }
        }

        void visitGroup(GroupElement* e) {
            if (e->name == _name) {
                result = e;
            }

            for (size_t i = 0; i < e->children.size(); ++i) {
                e->children[i]->handleVisitor(*this);
            }
        }

        void visitDummy(DummyElement* e) {
            if (e->name == _name) {
                result = e;
            }
        }

        MapElementPtr getResult() {
            return result;
        }

    private:
        std::string _name;
        MapElementPtr result;
    };

    MapElementPtr Map::findElementByName(const std::string& name) const {
        MapSearcher v(name);
        handleVisitor(v);
        return v.getResult();
    }

}
