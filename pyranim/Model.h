#ifndef INCLUDED_MODEL_H
#define INCLUDED_MODEL_H

#include <string>
#include <vector>
#include "IAlgebra.h"

class UndoListener {
public:
    virtual ~UndoListener() {}
    virtual void notify() = 0;
};

class Skeleton;
class View;
class Anim;

struct BoneInfo;
struct KeyInfo;

struct JointInfo {
    //IMatrix m_globalToLocalMat;
    IMatrix m_localToGlobalMat;
    int m_parent;
    IQuat m_parentQuat;
    IQuat m_quat;
    std::vector<int> m_children;
};

// Manages current mesh, current skeleton, views, animations, and
// undo/redo stack.
class Model {
public:
    Model();
    virtual ~Model();

    bool loadMesh(const char *filename);
    bool loadSkeleton(const char *filename);
    void addUndoListener(UndoListener *listener);
    void removeUndoListener(UndoListener *listener);
    bool modified() const;
    void pushUndoToken(const char *name);
    bool canUndo() const;
    bool canRedo() const;
    const char *getUndoName() const;
    const char *getRedoName() const;
    void undo();
    void redo();
    View *newView();
    bool freeView(View *view);
    void setTime(float time);
    int getNumAnims();
    Anim *getAnim(int index);
    Anim *loadAnim(const char *filename);
    Anim *newAnim();
    bool freeAnim(Anim *anim);
    void getKeyInfo(KeyInfo &info);
    int getNumJoints();
    const JointInfo &getJointInfo(int index);
    const char *getErrorString() const;

    void getGroundPlaneColor(IVector &color) const;
    const Skeleton &getSkeleton() const;

protected:
    std::string m_errorString;
    Skeleton *m_skeleton;
    IVector m_groundPlaneColor;
    bool m_jointsDirty;
    std::vector<JointInfo> m_joints;
    typedef std::vector<View *> ViewVector;
    ViewVector m_views;

    void recalcJoints();
    void refreshViews();

private:
    // Undefined:
    Model(const Model &);
    Model &operator=(const Model &);
};

#endif
