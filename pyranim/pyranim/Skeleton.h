#ifndef INCLUDED_SKELETON
#define INCLUDED_SKELETON

#include <string>
#include <vector>

#include "IAlgebra.h"

struct BoneInfo {
    std::string m_name;
    IPoint m_trans;
    IPoint m_rotQuat;
    IPoint m_localTrans;
    IPoint m_localRotQuat;
    int m_parent;
    std::vector<int> m_children;
};

class Skeleton {
public:
    Skeleton();
    bool load(const char *filename);
    int getNumBones() const;
    const BoneInfo &getBoneInfo(int index) const;
    const char *getErrorString() const;
protected:
    std::string m_errorString;
    std::vector<BoneInfo> m_bones;
};

#endif
