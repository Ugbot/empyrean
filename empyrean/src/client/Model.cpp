#include <fstream>
#include <string>
#include <vector>
#include <map>
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

    /** A quick and dirty adapter for CalCoreModel.
     *
     * Since CalCoreModel must be destroy()ed before any CalModels using it,
     * I was forced to refcount them without using the existing ResourceManager
     * codebase.  Regardless, it's encapsulated, and not too convoluted.  addRef()
     * right after you create() one, and decRef when you're through with it.
     *
     * I'm not entirely sure how sound it is from a design standpoint, but
     * CoreModel also does the parsing of the config files, in addition to
     * a RAW texture loader. (which only needs to exist while I'm using models
     * included in the cal3d test demo)
     * 
     */
    class CoreModel {
        typedef std::map<std::string,CoreModel*> InstanceMap;
        static InstanceMap _instances;

        CalCoreModel _coreModel;
        int _refCount;

        CoreModel(const std::string& id) {
            _coreModel.create(id);
            loadConfigFile(id, _coreModel);
            _refCount = 0;
        }

        ~CoreModel() {
            // gaaaaay.  But I can find no way to search a std::map for a certain value.
            for (InstanceMap::iterator i = _instances.begin(); i != _instances.end(); i++)
                if (i->second == this) {
                    _instances.erase(i);
                    break;
                }

            // deallocate textures
            for (int i = 0; i < _coreModel.getCoreMaterialCount(); i++) {
                CalCoreMaterial& material = *_coreModel.getCoreMaterial(i);

                for (int j = 0; j < material.getMapCount(); j++) {                    
                    pyr::u32 tex = (pyr::u32)material.getMapUserData(j);
                    glDeleteTextures(1, &tex);
                }
            }

            // deallocate the model
            _coreModel.destroy();
        }

        static void loadConfigFile(const string& fname, CalCoreModel& model) {
            string path;
            int p=fname.rfind('/');
            if (p != -1)
                path = fname.substr(0, fname.rfind('/')+1 );    // all the other files are assumed to be in the same directory as the data file itself.

            ifstream file(fname.c_str());
            std::string c;

            float scale;
            string skeleton;
            vector<string> animations;
            vector<string> meshes;
            vector<string> materials;

            int curline=1;
            while (file) {
                std::getline(file, c);
                vector<string> line = splitString(c, " \r\n\t=");

                if (line[0][0] == '#' || c[0]=='\0') {
                    ;   // do nothing at all
                } else if (line[0] == "scale") {
                    scale=(float)atof(line[1].c_str()); // @todo Do something with the scale?
                } else if (line[0] == "skeleton") {
                    skeleton=line[1];
                } else if (line[0] == "animation") {
                    animations.push_back(line[1]);
                } else if (line[0] == "mesh") {
                    meshes.push_back(line[1]);
                } else if (line[0] == "material") {
                    materials.push_back(line[1]);
                } else {
                    std::stringstream ss;
                    ss << "Unkown token \"" << line[0] << "\" on line " << curline << " in " << fname;
                    throw std::runtime_error(ss.str().c_str());
                }

                curline++;
            }

            file.close();

            // Actually load things, now that the config file has been consumed.
            struct CalException {};
            try {
                int result;

                result=model.loadCoreSkeleton(path + skeleton);
                if (!result)        throw CalException();

                for (u32 i = 0; i < animations.size(); i++) {
                    result=model.loadCoreAnimation(path + animations[i]);
                    if (result==-1) throw CalException();
                }

                for (u32 i = 0; i < meshes.size(); i++) {
                    result=model.loadCoreMesh(path + meshes[i]);
                    if (result==-1) throw CalException();
                }

                for (u32 i = 0; i < materials.size(); i++) {
                    result=model.loadCoreMaterial(path + materials[i]);
                    if (result==-1) throw CalException();
                }
            }
            catch (CalException) {
                std::stringstream ss;
                ss << "CoreModel::loadConfigFile " << fname << "(" << curline << "): " << CalError::getLastErrorText() << std::endl;
                throw std::runtime_error(ss.str().c_str());
            }

            // Load textures
            for (int i = 0; i < model.getCoreMaterialCount(); i++) {
                CalCoreMaterial& material=*model.getCoreMaterial(i);

                for (int j = 0; j < material.getMapCount(); j++) {
                    string s=material.getMapFilename(j);
                    u32 hTex=loadTexture(path + s); // for now, loading RAW textures.  TODO: replace with corona
                    material.setMapUserData(j,(Cal::UserData)hTex);
                }
            }

            // Assign material threads to materials.
            for (int i = 0; i < model.getCoreMaterialCount(); i++) {
                model.createCoreMaterialThread(i);
                model.setCoreMaterialId(i,0,i);
            }
        }

        //! Temporary RAW texture loader.
        static u32 loadTexture(const string& fname) {
            ifstream file;
            file.open(fname.c_str(), std::ios::in | std::ios::binary);

            int w, h, d;
            file.read((char*)&w, 4);
            file.read((char*)&h, 4);
            file.read((char*)&d, 4);

            ScopedArray<u8> pixels(new u8[w * h * d]);
            u8* p=pixels.get() + (h - 1) * w * d;

            // RAWs are stored bottom-to-top.  Flip as we read
            for (int i = 0; i < h; i++) {
                file.read((char*)p, w * d);
                p -= w * d;
            }

            file.close();

            int pixelformat = (d == 3) ? GL_RGB : GL_RGBA;

            u32 tex;
            glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
            glGenTextures(1, &tex);
            glBindTexture(GL_TEXTURE_2D, tex);
            glTexImage2D(GL_TEXTURE_2D, 0, pixelformat, w, h, 0, pixelformat, GL_UNSIGNED_BYTE, pixels.get());
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

            return tex;
        }

    public:
        //! "constructor"
        static CoreModel* create(const std::string& id) {
            CoreModel* m=_instances[id];

            if (!m) {
                m=new CoreModel(id);
                _instances[id]=m;
            }

            return m;
        }

        CalCoreModel* get() {
            return &_coreModel;
        }

        void addRef() {
            _refCount++;
        }

        void decRef() {
            _refCount--;

            if (_refCount == 0)
                delete this;
        }

    };

    CoreModel::InstanceMap CoreModel::_instances;

    template<>
    class CachePolicy<pyr::Model*> {
    public:
        static Model* create(const string& id) {
            return new Model(id);
        }
        
        static void destroy(Model* model) {
            delete model;
        }
    };

    Model* Model::create(const string& id) {
        return ResourceManager::instance().get<Model*>(id);
    }

    Model::Model(const string& fname) {
        _coreModel=CoreModel::create(fname);
        _coreModel->addRef();

        _model=new CalModel();
        _model->create(_coreModel->get());

        for (int i = 0; i < _coreModel->get()->getCoreMeshCount(); i++)
            _model->attachMesh(i);
        
        _model->setMaterialSet(0);

        _model->getMixer()->blendCycle(0, 1, 4.0f);
    }

    Model::~Model()
    {
        _model->destroy();
        delete _model;

        _coreModel->decRef();
    }

    CalCoreModel& Model::getCoreModel() {
        return *_coreModel->get();
    }

    CalModel& Model::getModel() {
        return *_model;
    }

    void Model::update(float timedelta) {
        PYR_PROFILE_BLOCK("Model::update");
        _model->update(timedelta);
    }
};
