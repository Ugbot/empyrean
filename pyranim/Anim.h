#ifndef INCLUDED_ANIM_H
#define INCLUDED_ANIM_H

#include <string>
#include <vector>
#include "IAlgebra.h"

typedef std::vector<float> FloatVector;
typedef std::vector<int> IntVector;

class AnimListener {
public:
    virtual ~AnimListener() {}
    virtual void notify() = 0;
};
typedef std::vector<AnimListener*> AnimListenerList;

struct KeyInfo {
    float m_time;
    IPoint m_trans;
    IQuat  m_rotQuat;
};

typedef std::vector<KeyInfo> KeyInfoVector;
struct Track {
    KeyInfoVector m_keys;
    int m_boneID;
};
typedef std::vector<Track> TrackVector;

class Model;

class Anim {
public:
    Anim(Model *model);
    virtual ~Anim();
    bool load(const char *filename);
    void setCurrent();
    void addAnimListener(AnimListener *listener);
    //void removeAnimListener(AnimListener *listener);
    void getBoneIDs(IntVector &ids) const;
    void getKeyTimes(int boneIndex, FloatVector &times,
                     float startTime, float endTime) const;
    void getKeyInfoAtTime(int boneIndex, float time, KeyInfo &keyInfo) const;
    void removeKey(float time);
    void addKey(float time, KeyInfo &keyInfo);
    Model *getModel() { return m_model; }
    const char *getErrorString() const;
    bool modified() { return m_modified; }

protected:
    Model *m_model;
    TrackVector m_tracks;
    std::string m_errorString;
    float m_duration;
    AnimListenerList m_animListeners;
    bool m_modified;

    void notifyAnimListeners();

private:
    // Not defined:
    Anim(const Anim &);
    Anim &operator=(const Anim &);
};

#endif
