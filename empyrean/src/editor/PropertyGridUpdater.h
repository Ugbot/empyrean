#ifndef PYR_PROPERTYGRIDUPDATER_H
#define PYR_PROPERTYGRIDUPDATER_H

#include "MapVisitor.h"

class wxGrid;

namespace pyr {

    /*
     * This is a visitor so that I can capitalize on the fact that MapElements 
     * are already equipped to deal with visitors on a per-type basis.  
     * Therefore, the property grid can be set to relevant values without 
     * resorting to RTTI.
     *
     * This visitor does not recurse at all.  
     * theNodeToBeUpdated->handleVisitor(&PropertyGridUpdater());
     */
    class PropertyGridUpdater : public MapVisitor {
    public:
        PropertyGridUpdater(wxGrid* grid);

        virtual void visitGeometry(GeometryElement* e);
        virtual void visitGroup(GroupElement* e);

    private:
        void setGridHeight(int newHeight);
        wxGrid* _grid;
    };

}

#endif