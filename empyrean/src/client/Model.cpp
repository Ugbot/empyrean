#include <cal3d/cal3d.h>
#include "Model.h"
#include "ResourceManager.h"

namespace pyr {
    /**
     * @fixme CalCoremodels need to have their destroy() method called before they are
     *        deleted.
     */
    template<>
    class CachePolicy<CalCoreModel*> {
    public:
        static CalCoreModel* create(const std::string& id) {
            CalCoreModel* m=new CalCoreModel;
            m->create(id);

            // @ todo Load up the core model's meshes, skeleton, textures, and so on
            //        here

            return m;
        }
    };

    template<>
    class CachePolicy<Model*> {
    public:
        static Model* create(const std::string& id) {
            return new Model(id);
        }
    };

    Model::Model(const std::string& fname) {
        _coreModel=ResourceManager::instance().get<CalCoreModel*>(fname);
        _model=new CalModel();
        _model->create(_coreModel);
    }

    Model::~Model()
    {
        //ResourceManager::instance().unRef<CalCoreModel*>(_coreModel); // or whatever, if/when it becomes necessary.
        _model->destroy();
        delete _model;
    }

    CalCoreModel& Model::getCoreModel() {
        return *_coreModel;
    }

    CalModel& Model::getModel() {
        return *_model;
    }

    void Model::update(float timedelta) {
        _model->update(timedelta);
    }
};
