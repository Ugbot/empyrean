#include "MapTreeUpdater.h"
#include "MapElement.h"

namespace pyr {

    MapTreeUpdater::MapTreeUpdater(wxTreeCtrl* treeView, const wxTreeItemId& root)
        : _treeView(treeView)
    {
        _parentId.push(root);

        _treeView->DeleteChildren(root);
    }

    void MapTreeUpdater::visitGeometry(GeometryElement* e) {
        _treeView->AppendItem(_parentId.top(), "Geometry Element");
    }

    void MapTreeUpdater::visitGroup(GroupElement* e) {
        _parentId.push(
            _treeView->AppendItem(_parentId.top(), "Group Element")
            );

        for (unsigned i = 0; i < e->children.size(); i++) {
            e->children[i]->handleVisitor(this);
        }

        _parentId.pop();
    }

}