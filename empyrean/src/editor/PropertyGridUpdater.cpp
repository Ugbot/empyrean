#include "MapElement.h"
#include "PropertyGridUpdater.h"
#include "Utility.h"
#include "wx.h"

namespace pyr {

    PropertyGridUpdater::PropertyGridUpdater(wxGrid* grid)
        : _grid(grid)
    {}

    void PropertyGridUpdater::visitGeometry(GeometryElement* e) {
        _grid->BeginBatch();

        std::string tex(e->material ? e->material->texture : "");

        setGridHeight(3);
        _grid->SetCellValue("Texture", 0, 0); _grid->SetCellValue(tex.c_str(), 0, 1);
        _grid->SetCellValue("x", 1, 0);       _grid->SetCellValue(va("%.3f", e->pos[0]).c_str(), 1, 1);
        _grid->SetCellValue("y", 2, 0);       _grid->SetCellValue(va("%.3f", e->pos[1]).c_str(), 2, 1);
        _grid->AutoSizeColumn(0);

        _grid->EndBatch();
    }

    void PropertyGridUpdater::visitGroup(GroupElement* e) {
        _grid->BeginBatch();

        setGridHeight(2);
        _grid->SetCellValue("x", 0, 0);       _grid->SetCellValue(va("%.3f", e->pos[0]).c_str(), 0, 1);
        _grid->SetCellValue("y", 1, 0);       _grid->SetCellValue(va("%.3f", e->pos[1]).c_str(), 1, 1);
        _grid->AutoSizeColumn(0);

        _grid->EndBatch();
    }

    void PropertyGridUpdater::setGridHeight(int newHeight) {
        // this is COMPLETELY retarded.  wxGrid has no way to just set the number of rows

        int delta = newHeight - _grid->GetRows();
        if (delta > 0) {
            _grid->AppendRows(delta);
        } else if (delta < 0) {
            _grid->DeleteRows(0, -delta);
        }

        for (int i = 0; i < newHeight; i++) {
            _grid->SetReadOnly(i, 0);
        }
    }
}
