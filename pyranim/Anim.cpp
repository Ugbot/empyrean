#include "Anim.h"
#include "Model.h"
#include <stdio.h>

Anim::Anim(Model *m) {
    m_model = m;
    m_modified = true;
}

Anim::~Anim() {
    for(int i = 0; i < (int) m_animListeners.size(); i ++) {
        delete m_animListeners[i];
    }
}

// XXX - Warning: Endian- and compiler-unsafe code here.
inline int readInt(FILE *fp) {
    int val = 0;
    fread(&val, sizeof(val), 1, fp);
    return val;
}

// XXX - Warning: Endian- and compiler-unsafe code here.
inline float readFloat(FILE *fp) {
    float val = 0.0f;
    fread(&val, sizeof(val), 1, fp);
    return val;
}

bool Anim::load(const char *filename) {
    FILE *fp = fopen(filename, "rb");
    if(!fp) {
        m_errorString = "Couldn't open file for reading.";
        return false;
    }
    const char CORRECT_HEADER[4] = {'C','A','F','\0'};
    char buf[4];
    fread(buf, 1, 4, fp);
    for(int i = 0; i < 4; i ++) {
        if(buf[i] != CORRECT_HEADER[i]) {
            m_errorString = "Invalid skeleton header.";
            fclose(fp);
            return false;
        }
    }
    int version = readInt(fp);
    if(version > 799 || version < 699) {
        m_errorString = "Wrong file version (";
        m_errorString += version;
        m_errorString += ").";
        fclose(fp);
        return false;
    }
    float duration = readFloat(fp);
    int numTracks = readInt(fp);
    TrackVector tracks;

    for(int i = 0; i < numTracks; i ++) {
        Track track;
        track.m_boneID = readInt(fp);
        int numKeys = readInt(fp);
        for(int j = 0; j < numKeys; j ++) {
            KeyInfo key;
            key.m_time = readFloat(fp);
            for(int k = 0; k < 3; k ++) key.m_trans  [k] = readFloat(fp);
            for(int k = 0; k < 4; k ++) key.m_rotQuat[k] = readFloat(fp);
            track.m_keys.push_back(key);
        }
        tracks.push_back(track);
        if(feof(fp)) break;
    }

    // File integrity checks.
    if(feof(fp)) {
        m_errorString = "Premature end-of-file.";
        return false;
    }
    readInt(fp);
    if(!feof(fp)) {
        m_errorString = "Garbage at end-of-file.";
        return false;
    }

    m_tracks = tracks;
    m_duration = duration;

    return true;
}

const char *Anim::getErrorString() const {
    return m_errorString.c_str();
}

void Anim::setCurrent() {
    m_model->setCurrentAnim(this);
}

void Anim::addAnimListener(AnimListener *listener) {
    m_animListeners.push_back(listener);
}

/*void Anim::removeAnimListener(AnimListener *listener) {
    assert(0); // XXX - Implement me.
}*/

void Anim::notifyAnimListeners() {
    for(int i = 0; i < (int) m_animListeners.size(); i ++) {
        m_animListeners[i]->notify();
    }
}

void Anim::getBoneIDs(IntVector &ids) const {
    for(int i = 0; i < (int) m_tracks.size(); i ++) {
        ids.push_back(m_tracks[i].m_boneID);
    }
}

void Anim::getKeyTimes(int boneIndex, FloatVector &times,
                       float startTime, float endTime) const {
    assert(boneIndex >= 0 && boneIndex < (int) m_tracks.size());
    const KeyInfoVector &keys = m_tracks[boneIndex].m_keys;
    for(int i = 0; i < (int) keys.size(); i ++) {
        float time = keys[i].m_time;
        if(time >= startTime && (time < endTime || endTime == -1.0f)) {
            times.push_back(time);
        }
    }
}

void Anim::getKeyInfoAtTime(int boneID, float time, KeyInfo &keyInfo) const {
    assert(0); // XXX - Implement me.
}

void Anim::removeKey(float time) {
    assert(0); // XXX - Implement me.
}

void Anim::addKey(float time, KeyInfo &keyInfo) {
    assert(0); // XXX - Implement me.
}

