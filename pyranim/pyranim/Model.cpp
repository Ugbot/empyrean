#include <cassert>
#include <algorithm>
#include <stdio.h>
#include "Model.h"
#include "View.h"
#include "Skeleton.h"

Model::Model() {
    m_skeleton = new Skeleton();
    m_jointsDirty = true;

    m_groundPlaneColor = IVector(0.5, 0.5, 0.5);
}

Model::~Model() {
    for(int i = 0; i < (int) m_views.size(); i ++) {
        delete m_views[i];
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
    assert(0); // XXX - Implement me.
}

void Model::removeUndoListener(UndoListener *listener) {
    assert(0); // XXX - Implement me.
}

bool Model::modified() const {
    assert(0); // XXX - Implement me.
    return false;
}

void Model::pushUndoToken(const char *name) {
    assert(0); // XXX - Implement me.
}

bool Model::canUndo() const {
    assert(0); // XXX - Implement me.
    return false;
}

bool Model::canRedo() const {
    assert(0); // XXX - Implement me.
    return false;
}

const char *Model::getUndoName() const {
    assert(0); // XXX - Implement me.
    return NULL;
}

const char *Model::getRedoName() const {
    assert(0); // XXX - Implement me.
    return NULL;
}

void Model::undo() {
    assert(0); // XXX - Implement me.
}

void Model::redo() {
    assert(0); // XXX - Implement me.
}

View *Model::newView() {
    View *v = new View(this);
    m_views.push_back(v);
    return v;
}

bool Model::freeView(View *view) {
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
    assert(0); // XXX - Implement me.
    return 0;
}

Anim *Model::getAnim(int index) {
    assert(0); // XXX - Implement me.
    return NULL;
}

Anim *Model::loadAnim(const char *filename) {
    assert(0); // XXX - Implement me.
    return NULL;
}

Anim *Model::newAnim() {
    assert(0); // XXX - Implement me.
    return NULL;
}

bool Model::freeAnim(Anim *anim) {
    assert(0); // XXX - Implement me.
    return false;
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
        IMatrix transMat = trans_mat(bi.m_trans - IPoint());
        IMatrix rotMat   = quat_to_mat(bi.m_rotQuat);
        if(ji.m_parent != -1) {
            IMatrix parentMat = m_joints[ji.m_parent].m_localToGlobalMat;
            ji.m_localToGlobalMat = parentMat * transMat * rotMat;
        } else {
            ji.m_localToGlobalMat =             transMat * rotMat;
        }

        m_joints.push_back(ji);
    }
    m_jointsDirty = false;
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
