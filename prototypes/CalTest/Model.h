#ifndef MODEL_H
#define MODEL_H

#include <string>
#include "cal3d.h"

class Model
{
    CalCoreModel coremodel;
    CalModel model;
    float scale;
    bool valid;

public:
    enum Action
    {
        stop,
        walk,
        run,
        strut,
        wave
    };

    Model();
    ~Model();

    bool Load(const std::string& fname);

    CalCoreModel&   GetCoreModel();
    CalModel&       GetModel();
    bool IsValid();
    void update(float td);
};

#endif