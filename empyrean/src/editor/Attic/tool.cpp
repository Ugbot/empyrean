#include "Tool.h"
#include "MapView.h"

namespace pyr {
    Tool::Tool(MapView* mv)
        : _mapView(mv)
    {}

    const MapFile* Tool::getMap() const {
        return &_mapView->getMap();
    }

    const MapView* Tool::getMapView() const {
        return _mapView;
    }
}