#ifndef PYR_MAPTREE_H
#define PYR_MAPTREE_H

#include "wx.h"

namespace pyr {

    class CommandReciever;
    class MapElement;
    class Map;

    class MapTree : public wxTreeCtrl {
    public:
        MapTree(wxWindow* parent, MainFrame* mainFrame, const wxPoint& pos = wxDefaultPosition, const wxSize& size = wxDefaultSize);
        ~MapTree();

        void update(const Map* map);

    private:
        wxMenu* _contextMenu;
        MainFrame* _mainFrame; // I dislike this.

        void onRightClick(wxMouseEvent& event);

        void onNewGeoNode(wxCommandEvent&);
        void onDestroyNode(wxCommandEvent&);

        DECLARE_EVENT_TABLE()
    };

}

#endif
