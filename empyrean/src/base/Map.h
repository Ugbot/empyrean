#ifndef PYR_MAP_H
#define PYR_MAP_H


#include <vector>
#include <string>
#include <map>
#include "Collider.h"
#include "MapElement.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Utility.h"

namespace pyr {

    class MapVisitor;

    class Map : public RefCounted {
    protected:
        ~Map() {
        }

    public:
        Map() {
            _root = new GroupElement;
        }

        GroupElementPtr getRoot() const {
            return _root;
        }

        void addElement(MapElementPtr e) {
            _isPartitioned = false;
            getRoot()->children.push_back(e);
        }

        void handleVisitor(MapVisitor& visitor) const {
            getRoot()->handleVisitor(visitor);
        }

        MapElementPtr findElementByName(const std::string& name) const;
        void getAllElements(std::vector<MapElementPtr>& elts) const;

        void getSegs(std::vector<Segment>& segs, float xposition) const;
        
    private:
        void processMap() const;

        // The root should always be a GroupElement.  It's rather convenient
        // to be able to assume that the root has children.
        GroupElementPtr _root;
        
        mutable Inited<bool, false> _isPartitioned;
        mutable std::vector<Segment> _mapSegs;
        
        struct Region {
            std::vector<Segment> _regionSegs;
            float minX;
            float maxX;
        };

        mutable std::vector<Region> _regions;
    };
    PYR_REF_PTR(Map);

}

#endif
