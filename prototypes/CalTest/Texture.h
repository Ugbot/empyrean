#ifndef TEXTURE_H
#define TEXTURE_H

#include <map>
#include <string>
#include "types.h"

class Texture
{
private:
    static uint nInstances;
    static std::map<std::string,uint> textures;
public:
    static uint Load(const std::string& fname);
};

#endif