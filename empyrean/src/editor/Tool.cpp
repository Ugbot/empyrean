#include "Editor.h"
#include "MainFrame.h"
#include "Tool.h"
#include "wx.h"

namespace pyr {

    MainFrame* Tool::getMainFrame() {
        return Editor::getMainFrame();
    }

    MapView* Tool::getMapView() {
        return getMainFrame()->getMapView();
    }

    MapPtr Tool::getMap() {
        return getMainFrame()->getMap();
    }
    
    MapElement* Tool::getSelectedElement() {
        return getMainFrame()->getSelectedElement();
    }

/*
    void Tool::setPropertiesGrid(std::map<std::string, std::string>& properties) {
        wxGrid* grid = getMainFrame()->getPropertiesGrid();

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
*/
}
