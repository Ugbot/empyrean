#include <stdio.h>
#include <conio.h>

#include "cal3d.h"

#include "types.h"
#include "model.h"
#include "StringLib.h"
#include "Texture.h"

using std::string;
using std::vector;
using std::cout;
using std::endl;

Model::Model()
{
    valid=false;
}

Model::~Model()
{
    model.destroy();
    coremodel.destroy();
}

void LoadTextures();

bool Model::Load(const string& fname)
{
    
    char c[256];

    FILE* f=fopen(fname.c_str(),"r");

    vector<string> meshes;
    vector<string> materials;
    vector<string> animations;
    string skeleton;

    while (!feof(f))
    {
        fgets(c,255,f);
        std::string s(c);
        str::trim(s);
        if (s[0]=='#' || s.length()==0)
            continue;

        std::vector<std::string> v=str::split(s," \n\r\t=");

        if (v[0]=="scale")
            scale=(float)atof(v[1].c_str());
        else if (v[0]=="skeleton")
            skeleton=v[1];
        else if (v[0]=="animation")
            animations.push_back(v[1]);
        else if (v[0]=="mesh")
            meshes.push_back(v[1]);
        else if (v[0]=="material")
            materials.push_back(v[1]);
        else 
            return false;
    }

    coremodel.create(fname);
    coremodel.loadCoreSkeleton(skeleton);
    for (uint i=0; i<animations.size(); i++)
    {
        cout << "Loading "<<animations[i]<<endl;
        coremodel.loadCoreAnimation(animations[i]);
    }

    for (uint i=0; i<meshes.size(); i++)
    {
        cout << "Loading "<<meshes[i]<<endl;
        coremodel.loadCoreMesh(meshes[i]);
    }

    for (uint i=0; i<materials.size(); i++)
    {
        cout << "Loading "<<materials[i]<<endl;
        coremodel.loadCoreMaterial(materials[i]);
    }

    for (uint i=0; i<materials.size(); i++)
    {
        CalCoreMaterial& m=*coremodel.getCoreMaterial(i);
        for (int t=0; t<m.getMapCount(); t++)
        {
            string texname=m.getMapFilename(t);
            cout << "Loading "<<texname<<endl;
            m.setMapUserData(t,(Cal::UserData)Texture::Load(texname));
        }
    }

    for (int i=0; i<coremodel.getCoreMaterialCount(); i++)
    {
        coremodel.createCoreMaterialThread(i);
        coremodel.setCoreMaterialId(i,0,i);
    }

    model.create(&coremodel);
    for (uint i=0; i<meshes.size(); i++)
        model.attachMesh(i);
    model.setMaterialSet(0);

    valid=true;
    return true;
}

CalCoreModel& Model::GetCoreModel()
{
    return coremodel;
}

CalModel& Model::GetModel()
{
    return model;
}

void Model::update(float td)
{
    model.update(td);
}