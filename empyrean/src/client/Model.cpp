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

    /*
     * It's clear now that we do indeed need an abstraction for CalCoreModel.
     * Firstly, CalCoreModel doesn't clean itself up in its destructor. (wtf)  We need to call its destroy() method.
     * Second, we need to deallocate any textures we've loaded.  We can do neither without some minimal wrapping.
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

            for (int i=0; i<model.getCoreMaterialCount(); i++) {
                CalCoreMaterial& material=*model.getCoreMaterial(i);

                for (int j=0; j<material.getMapCount(); j++) {
                    string s=material.getMapFilename(j);
                    u32 hTex=loadTexture(path+s); // for now, loading RAW textures.  TODO: replace with corona
                    material.setMapUserData(j,(Cal::UserData)hTex);
                }
            }

            for (int i=0; i<model.getCoreMaterialCount(); i++)
            {
                model.createCoreMaterialThread(i);
                model.setCoreMaterialId(i,0,i);
            }
        }

        //! Temporary RAW texture loader.
        static u32 loadTexture(const string& fname) {
            ifstream file;
            file.open(fname.c_str(),std::ios::in | std::ios::binary);

            int w,h,d;
            file.read((char*)&w,4);
            file.read((char*)&h,4);
            file.read((char*)&d,4);

            u8* pixels=new u8[w*h*d];
            u8* p=pixels+(h-1)*w*d;

            for (int i=0; i<h; i++) {
                file.read((char*)p,w*d);
                p-=w*d;
            }

            file.close();

            u32 tex;
            glPixelStorei(GL_UNPACK_ALIGNMENT,1);
            glGenTextures(1,&tex);
            glBindTexture(GL_TEXTURE_2D,tex);
            glTexImage2D(GL_TEXTURE_2D,0,d==3?GL_RGB:GL_RGBA,w,h,0,d==3?GL_RGB:GL_RGBA,GL_UNSIGNED_BYTE,pixels);
            glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);

            delete[] pixels;

            return tex;
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
        for (int i=0; i<_coreModel->getCoreMeshCount(); i++)
            _model->attachMesh(i);
        _model->setMaterialSet(0);

        _model->getMixer()->blendCycle(0,1,4.0f);
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
