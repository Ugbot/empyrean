#ifndef PYR_MODEL_H
#define PYR_MODEL_H

#include <cal3d/cal3d.h>
#include "OpenGL.h"

namespace pyr {
    class CoreModel;

    struct CalTexture {
        GLuint tex;
    };

    /** Encapsulates a 3D model.
     *
     * This doesn't represent a single model file; that's what CalCoreModel is for.
     * (I don't see a compelling reason to write a wrapper for that as well)
     * This represents a single instance of such a model file.
     *
     * It's a pretty thin abstraction, really.  It directly exposes both the CalCoreModel
     * and the CalModel, because their interfaces are pretty simple and as is.
     * We'll want to add higher level abstraction, like being able to say what
     * kind of equipment/weapon(s) a model has.
     *
     * Something to note is that this does not use ResourceManager.  You have to
     * new/delete it. (or just use ScopedPtr)
     */
    class Model {
    public:
        Model(const std::string& fname);
        ~Model();

        CalCoreModel& getCoreModel();
        CalModel& getModel();
        
        float getScale() const {
            return _scale;
        }

        void update(float timedelta);

    private:
        CoreModel* _coreModel;
        CalModel _model;
        float _scale;
        // We'll probably want to store information on how this particular model
        // is skinned, and so on.
    };
};

#endif
