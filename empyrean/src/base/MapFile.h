#ifndef PYR_MAP_H
#define PYR_MAP_H


#include <vector>
#include <string>
#include <map>

#include "MapElement.h"

#include "Utility.h"

namespace pyr {

    class Map {
    public:

        Map();
        Map(const std::string& fileName);
        //Map(std::istream& file);
        ~Map();

        RefPtr<GroupElement> getRoot() const;

        void save(const std::string& fileName);
    private:
        // The root should always be a GroupElement.  It's rather convenient
        // to be able to assume that the root has children.
        RefPtr<GroupElement> _root;
    };

}

#endif
