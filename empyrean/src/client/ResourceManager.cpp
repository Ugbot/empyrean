#include "ResourceManager.h"


namespace pyr {

    ResourceManager* ResourceManager::_instance = 0;

    ResourceManager& ResourceManager::instance() {
        if (!_instance) {
            _instance = new ResourceManager();
            atexit(destroy);
        }
        return *_instance;
    }
    
    void ResourceManager::destroy() {
        delete _instance;
        _instance = 0;
    }
    
    ResourceManager::~ResourceManager() {
        CacheMap::iterator itr = _cacheMap.begin();
        for (; itr != _cacheMap.end(); ++itr) {
            delete itr->second;
        }
    }

}
