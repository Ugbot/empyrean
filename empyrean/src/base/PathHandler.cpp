#include "PathHandler.h"
#include "Utility.h"


namespace pyr {

    std::string PathHandler::findFile(const std::string& filename) const {
        StringList::const_iterator path = _paths.begin();
        for (; path != _paths.end(); ++path) {
            const std::string fullPath = joinPath(*path, filename);
            if (fileExists(fullPath)) {
                return fullPath;
            }
        }

        return filename;
    }

}
