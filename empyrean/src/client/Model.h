#ifndef PYR_MODEL_H
#define PYR_MODEL_H

#include <string>
#include <vector>
#include <cal3d/cal3d.h>
#include "Error.h"
#include "OpenGL.h"
#include "RefPtr.h"

namespace pyr {

    class CoreModel;
    PYR_REF_PTR(CoreModel);

    struct CalTexture {
        GLuint tex;
    };

    PYR_DEFINE_RUNTIME_ERROR(LoadModelError);

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
     * new/delete it. (Or just use ScopedPtr.)  The appropriate data will be shared
     * automatically.
     */
    class Model {
    public:
        Model(const std::string& fname);
        ~Model();

        CalCoreModel& getCoreModel() const;
        CalModel& getModel();
        const CalModel& getModel() const;

        float getScale() const {
            return _scale;
        }

        const float* getMatrix() const;

        void update(float timedelta);
        void blendCycle(const std::string& animation, float weight, float delay);
        void executeAction(const std::string& animation, float weight, float delayIn, float delayOut);

    private:
        CoreModelPtr _coreModel;
        CalModel _model;
        float _scale;
        float _matrix[4 * 4];

        // We'll probably want to store information on how this particular model
        // is skinned, and so on.
        
        Inited<int, -1> _lastCycle;
    };
}

#endif
