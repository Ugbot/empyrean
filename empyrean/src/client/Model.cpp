#include <fstream>
#include <string>
#include <vector>
#include <sstream>

#include <cal3d/cal3d.h>

#include "Model.h"
#include "ResourceManager.h"
#include "Profiler.h"
#include "Utility.h"
#include "Types.h"

namespace pyr {
    using std::ifstream;
    using std::string;
    using std::vector;

    /**
     * @fixme CalCoremodels need to have their destroy() method called before they are
     *        deleted.
     */
    template<>
    class CachePolicy<CalCoreModel*> {
    public:
        static CalCoreModel* create(const string& id) {
            CalCoreModel* m=new CalCoreModel;
            m->create(id);
            loadConfigFile(id, *m);
            return m;
        }

    private:
        /** Loads things into a CalCoreModel from a data file.
         * 
         * @ param fname Name of the data file to use.
         * @ param model the CalCoreModel to load things into.
         */
        static void loadConfigFile(const string& fname, CalCoreModel& model) {
            string path;
            int p=fname.rfind('/');
            if (p != -1)
                path = fname.substr(0, fname.rfind('/')+1 );    // all the other files are assumed to be in the same directory as the data file itself.

            ifstream file(fname.c_str());
            char c[256];

            float scale;
            string skeleton;
            vector<string> animations;
            vector<string> meshes;
            vector<string> materials;

            int curline=1;
            while (file.good()) {
                file.getline(c, 255);
                vector<string> line = splitString(c, " \r\n\t=");

                if (line[0][0] == '#' || c[0]=='\0')
                    ;   // do nothing at all
                else if (line[0] == "scale")
                    scale=(float)atof(line[1].c_str()); // @todo Do something with the scale?
                else if (line[0] == "skeleton")
                    skeleton=line[1];
                else if (line[0] == "animation")
                    animations.push_back(line[1]);
                else if (line[0] == "mesh")
                    meshes.push_back(line[1]);
                else if (line[0] == "material")
                    materials.push_back(line[1]);
                else
                {
                    std::stringstream ss;
                    ss << "Unkown token \"" << line[0] << "\" on line " << curline << " in " << fname;
                    throw std::exception(ss.str().c_str());
                }

                curline++;
            }

            model.loadCoreSkeleton(path+skeleton);
            for (u32 i = 0; i < animations.size(); i++)
                model.loadCoreAnimation(path+animations[i]);

            for (u32 i = 0; i < meshes.size(); i++)
                model.loadCoreMesh(path+meshes[i]);

            for (u32 i = 0; i < materials.size(); i++)
                model.loadCoreMaterial(path+materials[i]);
        }
    };

    template<>
    class CachePolicy<pyr::Model*> {
    public:
        static Model* create(const string& id) {
            return new Model(id);
        }
    };

    Model* Model::create(const std::string& id) {
        return ResourceManager::instance().get<Model*>(id);
    }

    Model::Model(const string& fname) {
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
        PYR_PROFILE_BLOCK("Model::update");
        _model->update(timedelta);
    }
};
