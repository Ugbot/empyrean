#ifndef INCLUDED_ANIM_H
#define INCLUDED_ANIM_H

#include <vector>
#include "IAlgebra.h"

typedef std::vector<float> FloatVector;

class AnimListener {
public:
    virtual ~AnimListener() {}
    virtual void notify() = 0;
};

struct KeyInfo {
    float m_time;
    IPoint m_trans;
    IPoint m_rotQuat;
};

class Anim {
public:
    Anim();
    bool load(const char *filename);
    void setCurrent();
    void addAnimListener(AnimListener &listener);
    void removeAnimListener(AnimListener &listener);
    void getKeyTimes(int boneID, FloatVector &times) const;
    void getKeyInfoAtTime(float time, KeyInfo &keyInfo) const;
    void removeKey(float time);
    void addKey(float time, KeyInfo &keyInfo);
protected:
private:
    // Not defined:
    Anim(const Anim &);
    Anim &operator=(const Anim &);
};

#endif
