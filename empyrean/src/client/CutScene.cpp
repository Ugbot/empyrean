#include "CutScene.h"
#include "Texture.h"


namespace pyr {

    void CutScene::addImage(const std::string& filename) {
        _images.push_back(Texture::create(filename));
    }

}
