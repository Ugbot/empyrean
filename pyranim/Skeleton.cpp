#include "Skeleton.h"
#include <stdio.h>

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

Skeleton::Skeleton() {
}

bool Skeleton::load(const char *filename) {
    FILE *fp = fopen(filename, "rb");
    if(!fp) {
        m_errorString = "Couldn't open file for reading.";
        return false;
    }
    const char CORRECT_HEADER[4] = {'C','S','F','\0'};
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
    int numBones = readInt(fp);

    std::vector<BoneInfo> bones;

    for(int i = 0; i < numBones; i ++) {
        BoneInfo bone;
        int nameLen = readInt(fp);
        char *nameBuf = new char [nameLen + 1];
        fread(nameBuf, 1, nameLen, fp);
        nameBuf[nameLen] = '\0';
        bone.m_name = nameBuf;
        for(int j = 0; j < 3; j ++) bone.m_trans[j] = readFloat(fp);
        for(int j = 0; j < 4; j ++) bone.m_rotQuat[j] = readFloat(fp);
        for(int j = 0; j < 3; j ++) bone.m_localTrans[j] = readFloat(fp);
        for(int j = 0; j < 4; j ++) bone.m_localRotQuat[j] = readFloat(fp);
        bone.m_parent = readInt(fp);
        int numChildren = readInt(fp);
        for(int j = 0; j < numChildren; j ++) {
            int childNum = readInt(fp);
            bone.m_children.push_back(childNum);
        }
        bones.push_back(bone);
    }

    // XXX - verify parent-child connections?
    // XXX - verify lack of cycles.

    if(feof(fp)) {
        m_errorString = "Premature end-of-file.";
        return false;
    }
    readInt(fp);
    if(!feof(fp)) {
        m_errorString = "Garbage at end-of-file.";
        return false;
    }

    m_bones = bones;

    return true;
}

int Skeleton::getNumBones() const {
    return m_bones.size();
}

const BoneInfo &Skeleton::getBoneInfo(int index) const {
    return m_bones[index];
}

const char *Skeleton::getErrorString() const {
    return m_errorString.c_str();
}


