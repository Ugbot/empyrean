#include <cassert>
#include <algorithm>
#include <stdio.h>
#include "Anim.h"
#include "Model.h"
#include "View.h"
#include "Skeleton.h"

Model::Model() {
    m_skeleton = new Skeleton();
    m_jointsDirty = true;

    m_groundPlaneColor = IVector(0.5, 0.5, 0.5);
}

Model::~Model() {
    //printf("Leaked views: %d\n", (int) m_views.size()); fflush(stdout);
    for(int i = 0; i < (int) m_views.size(); i ++) {
        delete m_views[i];
    }
    //printf("Leaked anims: %d\n", (int) m_anims.size()); fflush(stdout);
    for(int i = 0; i < (int) m_anims.size(); i ++) {
        delete m_anims[i];
    }
    delete m_skeleton;
}

bool Model::loadMesh(const char *filename) {
    printf("loadMesh\n"); fflush(stdout);
    return false;
}

bool Model::loadSkeleton(const char *filename) {
    if(!m_skeleton->load(filename)) {
        m_errorString = m_skeleton->getErrorString();
        return false;
    }
    m_jointsDirty = true;
    refreshViews();
    return true;
}

void Model::addUndoListener(UndoListener *listener) {
    printf("Model::addUndoListener\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
}

/*void Model::removeUndoListener(UndoListener *listener) {
    assert(0); // XXX - Implement me.
}*/

bool Model::modified() const {
    assert(0); // XXX - Implement me.
    return false;
}

void Model::pushUndoToken(const char *name) {
    printf("Model::pushUndoToken\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
}

bool Model::canUndo() const {
    printf("Model::canUndo\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
    return true;
}

bool Model::canRedo() const {
    printf("Model::canRedo\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
    return true;
}

const char *Model::getUndoName() const {
    printf("Model::getUndoName\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
    return NULL;
}

const char *Model::getRedoName() const {
    printf("Model::getRedoName\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
    return NULL;
}

void Model::undo() {
    printf("Model::undo\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
}

void Model::redo() {
    printf("Model::redo\n"); fflush(stdout);
    //assert(0); // XXX - Implement me.
}

View *Model::newView() {
    View *v = new View(this);
    m_views.push_back(v);
    return v;
}

bool Model::freeView(View *view) {
    printf("Model::freeView called\n"); fflush(stdout);
    ViewVector::iterator vi = find(m_views.begin(), m_views.end(), view);
    if(vi != m_views.end()) {
        delete (*vi);
        m_views.erase(vi);
        return true;
    }
    return false;
}

void Model::setTime(float time) {
    assert(0); // XXX - Implement me.
}

int Model::getNumAnims() {
    return (int) m_anims.size();
}

Anim *Model::getAnim(int index) {
    if(index < 0 || index >= (int) m_anims.size()) return NULL;
    return m_anims[index];
}

Anim *Model::loadAnim(const char *filename) {
    Anim *anim = new Anim(this);
    if(!anim->load(filename)) {
        m_errorString = anim->getErrorString();
        delete anim;
        return NULL;
    }
    m_anims.push_back(anim);
    return anim;
}

Anim *Model::newAnim() {
    assert(0); // XXX - Implement me.
    return NULL;
}

void Model::setCurrentAnim(Anim *anim) {
    assert(anim->getModel() == this);
    assert(0); // XXX - Implement me.
}

bool Model::freeAnim(Anim *anim) {
    AnimVector::iterator avi = find(m_anims.begin(), m_anims.end(), anim);
    if(avi == m_anims.end()) return false;
    delete (*avi);
    m_anims.erase(avi);
    return true;
}

void Model::getKeyInfo(KeyInfo &info) {
    assert(0); // XXX - Implement me.
}

int Model::getNumJoints() {
    if(m_jointsDirty) {
        recalcJoints();
    }
    return m_joints.size();
}

const JointInfo &Model::getJointInfo(int index) {
    if(m_jointsDirty) {
        recalcJoints();
    }
    return m_joints[index];
}

void Model::setJointRotTrans(int index,
                             const IQuat &quat,
                             const IVector &trans) {
    // XXX - Set joint info for now...
    m_joints[index].m_quat  = quat;
    m_joints[index].m_trans = trans;
    recalcJointChain();
}

void Model::recalcJoints() {
    const Skeleton &s = getSkeleton();
    int numBones = s.getNumBones();
    m_joints.erase(m_joints.begin(), m_joints.end());
    for(int i = 0; i < numBones; i ++) {
        const BoneInfo &bi = s.getBoneInfo(i);
        JointInfo ji;
        ji.m_parent   = bi.m_parent;
        ji.m_children = bi.m_children;

        // XXX - Default matrices for now.
        ji.m_quat        = bi.m_rotQuat;
        ji.m_trans       = bi.m_trans - IPoint();
        m_joints.push_back(ji);
    }
    recalcJointChain();

    m_jointsDirty = false;
}

void Model::recalcJointChain() {
    for(int i = 0; i < (int) m_joints.size(); i ++) {
        JointInfo &ji = m_joints[i];
        if(ji.m_parent == -1) {
            ji.m_compQuat = ji.m_quat;
            ji.m_compTrans = ji.m_trans;
        } else {
            JointInfo &pji = m_joints[ji.m_parent];
            ji.m_compQuat = (ji.m_quat * pji.m_compQuat);
            ji.m_compTrans = (quat_to_mat(pji.m_compQuat) * ji.m_trans +
                              pji.m_compTrans);
        }
        ji.m_localToGlobalMat = (trans_mat(ji.m_compTrans) *
                                 quat_to_mat(ji.m_compQuat));
    }
}

void Model::refreshViews() {
    for(int i = 0; i < (int) m_views.size(); i ++) {
        m_views[i]->notifyViewListeners();
    }
}

const char *Model::getErrorString() const {
    return m_errorString.c_str();
}

void Model::getGroundPlaneColor(IVector &color) const {
    color = m_groundPlaneColor;
}

const Skeleton &Model::getSkeleton() const {
    return *m_skeleton;
}
