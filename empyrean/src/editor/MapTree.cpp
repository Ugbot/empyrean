#include "MainFrame.h"
#include "MapFile.h"
#include "MapTree.h"
#include "MapTreeUpdater.h"
#include "MapFile.h"
#include "MapElement.h"

namespace pyr {

    BEGIN_EVENT_TABLE(MapTree, wxTreeCtrl)
        EVT_RIGHT_DOWN(MapTree::onRightClick)
    END_EVENT_TABLE()

    MapTree::MapTree(wxWindow* parent, const wxPoint& pos, const wxSize& size)
        : wxTreeCtrl(parent, -1, pos, size, wxTR_DEFAULT_STYLE | wxTR_HIDE_ROOT)
        , _contextMenu(new wxMenu)
    {
        _contextMenu->Append(0, "NYI!!");
    }

    void MapTree::update(Map* map) {
        MapTreeUpdater updater(this, GetRootItem());
        DeleteChildren(GetRootItem());
        map->getRoot()->handleVisitor(&updater);
    }

    void MapTree::onRightClick(wxMouseEvent& event) {
        int flags;
        wxTreeItemId id = HitTest(event.GetPosition(), flags);

        if (id) {
            PopupMenu(_contextMenu, event.GetPosition());
        }
    }

}
