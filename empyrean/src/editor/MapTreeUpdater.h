#ifndef PYR_MAPTREEUPDATER_H
#define PYR_MAPTREEUPDATER_H

#include <stack>

#include "wx.h" // This sucks.  I'd rather just include wx/treectrl.h
#include "MapVisitor.h"

namespace pyr {

    class MapTreeUpdater : public MapVisitor {
    public:
        MapTreeUpdater(wxTreeCtrl* treeView, const wxTreeItemId& root);

        virtual void visitGeometry(GeometryElement* e);
        virtual void visitGroup(GroupElement* e);

    private:
        /**
         * The TreeView we are updating.
         */
        wxTreeCtrl* _treeView;

        /** 
         * Explicit stack of where we are in the tree, since we can't outright
         * recurse, and thereby keep such a list implicitly.
         */
        std::stack<wxTreeItemId> _parentId;

    };

}

#endif
