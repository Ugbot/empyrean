#include "ResourceManager.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(ResourceManager)

    ResourceManager::~ResourceManager() {
        CacheMap::iterator itr = _cacheMap.begin();
        for (; itr != _cacheMap.end(); ++itr) {
            delete itr->second;
        }
    }

}
