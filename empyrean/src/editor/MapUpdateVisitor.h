#ifndef PYR_MAPUPDATEVISITOR_H
#define PYR_MAPUPDATEVISITOR_H

#include "MapElement.h"
#include "MapVisitor.h"

namespace pyr {

    /**
     * The compliment of the PropertyGridUpdater class, MapUpdateVisitor
     * responds to changes to the grid, performing whatever needs to be done
     * to update the map element which the user is editing.
     */
    class MapUpdateVisitor : public MapVisitor {
    public:
        MapUpdateVisitor(const std::string& property, const std::string& newValue);

        virtual void visitGeometry(GeometryElement* e);
        virtual void visitGroup(GroupElement* e);

    private:
        std::string _property;
        std::string _newValue;
    };

}

#endif