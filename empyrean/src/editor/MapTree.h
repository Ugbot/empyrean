#ifndef PYR_MAPTREE_H
#define PYR_MAPTREE_H

#include "wx.h"

namespace pyr {

    class MapElement;
    class Map;

    class MapTree : public wxTreeCtrl {
    public:
        MapTree(wxWindow* parent, const wxPoint& pos = wxDefaultPosition, const wxSize& size = wxDefaultSize);

        void update(Map* map);

        class TreeItemData : public wxTreeItemData {
        public:
            MapElement* element;
        };

    private:
        wxMenu* _contextMenu;

        void onRightClick(wxMouseEvent& event);

        DECLARE_EVENT_TABLE()
    };

}

#endif