#include "wx.h"
#include "Tool.h"
#include "MainFrame.h"

namespace pyr {
    Tool::Tool(MainFrame* mf)
        : _mainFrame(mf)
    {}

    MainFrame* Tool::getMainFrame() const {
        return _mainFrame;
    }

    MapView* Tool::getMapView() const {
        return _mainFrame->_mapView;
    }

    const MapFile* Tool::getMap() const {
        return _mainFrame->getMap();
    }

    void Tool::setPropertiesGrid(std::map<std::string, std::string>& properties) {
        wxGrid* grid = _mainFrame->_propertiesGrid;

        grid->BeginBatch();
        grid->ClearGrid();

        // this is COMPLETELY retarded.  wxGrid has no way to just set the number of rows
        int delta = properties.size() - grid->GetRows();
        if (delta > 0) {
            grid->AppendRows(delta);
        } else if (delta < 0) {
            grid->DeleteRows(0, -delta);
        }

        int i = 0;
        for (std::map<std::string, std::string>::iterator
            iter = properties.begin();
            iter != properties.end();
            iter++)
        {
            grid->SetCellValue(iter->first.c_str(), i, 0);
            grid->SetCellValue(iter->second.c_str(), i, 1);
            grid->SetReadOnly(i, 0, true);
            i++;
        }

        grid->AutoSizeColumn(0);
        grid->EndBatch();
    }
}
