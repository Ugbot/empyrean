#ifndef PYR_PATH_HANDLER_H
#define PYR_PATH_HANDLER_H


#include <string>
#include <list>
#include "Debug.h"


namespace pyr {

    /**
     * An object that facilitates searching a set of resource directories
     * for a file.  I don't really like the name though.  :(  Suggestions
     * are welcome.
     */
    class PathHandler {
    public:
        void push_front(const std::string& path) {
            _paths.push_front(path);
        }

        void pop_front() {
            PYR_ASSERT(!_paths.empty(), "Can't pop from an empty list");
            _paths.pop_front();
        }

        /**
         * Searches the path list and returns a full path to the file if it
         * is found, otherwise returns the filename unmodified.
         */
        std::string findFile(const std::string& filename) const;

    private:
        typedef std::list<std::string> StringList;
        StringList _paths;
    };


    /**
     * Pushes a path onto the front of the specified path handler for
     * as long as this object is in scope.  Removes path on destruction.
     */
    class ScopedPathSearch {
    public:
        ScopedPathSearch(PathHandler& ph, const std::string& path)
            : _ph(ph)
        {
            _ph.push_front(path);
        }

        ~ScopedPathSearch() {
            _ph.pop_front();
        }

    private:
        PathHandler& _ph;
    };

}


#endif
