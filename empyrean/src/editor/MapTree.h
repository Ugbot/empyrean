#ifndef PYR_MAPTREE_H
#define PYR_MAPTREE_H

#include "wx.h"

namespace pyr {

    class CommandReciever;
    class MapElement;
    class Map;

    class TreeItemData : public wxTreeItemData {
    public:
        MapElement* element;

        TreeItemData(MapElement* e)
            : element(e)
        {}
    };

    class MapTree : public wxTreeCtrl {
    public:
        MapTree(wxWindow* parent, const wxPoint& pos = wxDefaultPosition, const wxSize& size = wxDefaultSize);
        ~MapTree();

        void update(const Map* map);

        MapElement* getSelection() const;

    private:
        wxMenu* _contextMenu;

        void onRightClick(wxMouseEvent& event);

        void onNewGeoNode(wxCommandEvent&);
        void onDestroyNode(wxCommandEvent&);

        DECLARE_EVENT_TABLE()
    };

}

#endif
