#ifndef PYR_CUT_SCENE_H
#define PYR_CUT_SCENE_H


#include <vector>
#include "RefCounted.h"
#include "RefPtr.h"


namespace pyr {

    class Texture;

    class CutScene : public RefCounted {
    protected:
        ~CutScene() { }

    public:
        void addImage(const std::string& filename);

        size_t getImageCount() const { return _images.size(); }
        Texture* getImage(size_t i) const { return _images[i]; }

    private:
        std::vector<Texture*> _images;
    };
    typedef RefPtr<CutScene> CutScenePtr;

}


#endif
