#include <stdio.h>
#include <Python.h>
#include <map>

#include "Anim.h"
#include "Model.h"
#include "View.h"

static PyObject *s_animError;

struct AnimModAnim;
struct AnimModModel;
struct AnimModView;

/*** Listener declarations */
class ViewListenerImpl : public ViewListener {
public:
    ViewListenerImpl(PyObject *obj) {
        m_obj = obj;
        Py_INCREF(m_obj);
    }
    virtual ~ViewListenerImpl() {
        Py_DECREF(m_obj);
    }
    virtual void notify() {
        if(PyObject_CallFunction(m_obj, NULL) == NULL) {
            printf("ViewListenerImpl CallFunction failed.\n");
            fflush(stdout);
        }
    }
protected:
    PyObject *m_obj;
private:
    // Not implemented:
    ViewListenerImpl(const ViewListenerImpl &);
    ViewListenerImpl& operator=(const ViewListenerImpl &);
};

class StatusListenerImpl : public StatusListener {
public:
    StatusListenerImpl(PyObject *obj) {
        m_obj = obj;
        Py_INCREF(m_obj);
    }
    virtual ~StatusListenerImpl() {
        Py_DECREF(m_obj);
    }
    virtual void notify(const char *msg) {
        if(PyObject_CallFunction(m_obj, "s", msg) == 0) {
            printf("StatusListenerImpl CallFunction failed.\n");
            fflush(stdout);
        }
    }
protected:
    PyObject *m_obj;
private:
    // Not implemented:
    StatusListenerImpl(const StatusListenerImpl &);
    StatusListenerImpl& operator=(const StatusListenerImpl &);
};

class UndoListenerImpl : public UndoListener {
public:
    UndoListenerImpl(PyObject *obj) {
        m_obj = obj;
        Py_INCREF(m_obj);
    }
    virtual ~UndoListenerImpl() {
        Py_DECREF(m_obj);
    }
    virtual void notify() {
        if(PyObject_CallFunction(m_obj, NULL) == 0) {
            printf("UndoListenerImpl CallFunction failed.\n");
            fflush(stdout);
        }
    }
protected:
    PyObject *m_obj;
private:
    // Not implemented:
    UndoListenerImpl(const UndoListenerImpl &);
    UndoListenerImpl& operator=(const UndoListenerImpl &);
};


/*** Model declarations. */

static void s_model_dealloc(PyObject *self);
static PyObject *s_model_getAttr(PyObject *self, char *name);

static PyObject *s_model_loadMesh          (PyObject *self, PyObject *args);
static PyObject *s_model_loadSkeleton      (PyObject *self, PyObject *args);
static PyObject *s_model_addUndoListener   (PyObject *self, PyObject *args);
//static PyObject *s_model_removeUndoListener(PyObject *self, PyObject *args);
static PyObject *s_model_modified          (PyObject *self, PyObject *args);
static PyObject *s_model_pushUndoToken     (PyObject *self, PyObject *args);
static PyObject *s_model_canUndo           (PyObject *self, PyObject *args);
static PyObject *s_model_canRedo           (PyObject *self, PyObject *args);
static PyObject *s_model_getUndoName       (PyObject *self, PyObject *args);
static PyObject *s_model_getRedoName       (PyObject *self, PyObject *args);
static PyObject *s_model_undo              (PyObject *self, PyObject *args);
static PyObject *s_model_redo              (PyObject *self, PyObject *args);
static PyObject *s_model_newView           (PyObject *self, PyObject *args);
static PyObject *s_model_getNumAnims       (PyObject *self, PyObject *args);
static PyObject *s_model_getAnim           (PyObject *self, PyObject *args);
static PyObject *s_model_loadAnim          (PyObject *self, PyObject *args);
static PyObject *s_model_newAnim           (PyObject *self, PyObject *args);
static PyObject *s_model_getKeyInfo        (PyObject *self, PyObject *args);
static PyObject *s_model_getNumBones       (PyObject *self, PyObject *args);
static PyObject *s_model_getBoneInfo       (PyObject *self, PyObject *args);

struct AnimModModel {
    PyObject_HEAD
    Model *m_model;
};

static PyTypeObject s_modelType = {
    PyObject_HEAD_INIT(NULL)
    0,
    "Model",
    sizeof(AnimModModel),
    0,
    s_model_dealloc,     /* tp_dealloc     */
    0,                  /* tp_print       */
    s_model_getAttr,     /* tp_getattr     */
    0,                  /* tp_setattr     */
    0,                  /* tp_compare     */
    0,                  /* tp_repr        */
    0,                  /* tp_as_number   */
    0,                  /* tp_as_sequence */
    0,                  /* tp_as_mapping  */
    0,                  /* tp_hash        */
};

#define MV METH_VARARGS
static PyMethodDef s_modelMethods[] = {
    {"loadMesh",           (PyCFunction)s_model_loadMesh,           MV, ""},
    {"loadSkeleton",       (PyCFunction)s_model_loadSkeleton,       MV, ""},
    {"addUndoListener",    (PyCFunction)s_model_addUndoListener,    MV, ""},
    //{"removeUndoListener", (PyCFunction)s_model_removeUndoListener, MV, ""},
    {"modified",           (PyCFunction)s_model_modified,           MV, ""},
    {"pushUndoToken",      (PyCFunction)s_model_pushUndoToken,      MV, ""},
    {"canUndo",            (PyCFunction)s_model_canUndo,            MV, ""},
    {"canRedo",            (PyCFunction)s_model_canRedo,            MV, ""},
    {"getUndoName",        (PyCFunction)s_model_getUndoName,        MV, ""},
    {"getRedoName",        (PyCFunction)s_model_getRedoName,        MV, ""},
    {"undo",               (PyCFunction)s_model_undo,               MV, ""},
    {"redo",               (PyCFunction)s_model_redo,               MV, ""},
    {"newView",            (PyCFunction)s_model_newView,            MV, ""},
    {"getNumAnims",        (PyCFunction)s_model_getNumAnims,        MV, ""},
    {"getAnim",            (PyCFunction)s_model_getAnim,            MV, ""},
    {"loadAnim",           (PyCFunction)s_model_loadAnim,           MV, ""},
    {"newAnim",            (PyCFunction)s_model_newAnim,            MV, ""},
    {"getKeyInfo",         (PyCFunction)s_model_getKeyInfo,         MV, ""},
    {"getNumBones",        (PyCFunction)s_model_getNumBones,        MV, ""},
    {"getBoneInfo",        (PyCFunction)s_model_getBoneInfo,        MV, ""},
};
#undef MV

/*** View declarations. */

static AnimModView *s_view_new(AnimModModel *model);
static void s_view_dealloc(PyObject *self);
static PyObject *s_view_getAttr(PyObject *self, char *name);

static PyObject *s_view_setPosition         (PyObject *self, PyObject *args);
static PyObject *s_view_setDirection        (PyObject *self, PyObject *args);
static PyObject *s_view_initGL              (PyObject *self, PyObject *args);
static PyObject *s_view_draw                (PyObject *self, PyObject *args);
static PyObject *s_view_setSize             (PyObject *self, PyObject *args);
static PyObject *s_view_addViewListener     (PyObject *self, PyObject *args);
//static PyObject *s_view_removeViewListener  (PyObject *self, PyObject *args);
static PyObject *s_view_addStatusListener   (PyObject *self, PyObject *args);
//static PyObject *s_view_removeStatusListener(PyObject *self, PyObject *args);
static PyObject *s_view_setCurrent          (PyObject *self, PyObject *args);
static PyObject *s_view_navMouseDown        (PyObject *self, PyObject *args);
static PyObject *s_view_navMouseMove        (PyObject *self, PyObject *args);
static PyObject *s_view_navMouseUp          (PyObject *self, PyObject *args);
static PyObject *s_view_mouseDown           (PyObject *self, PyObject *args);
static PyObject *s_view_mouseMove           (PyObject *self, PyObject *args);
static PyObject *s_view_mouseUp             (PyObject *self, PyObject *args);
static PyObject *s_view_getToolMode         (PyObject *self, PyObject *args);
static PyObject *s_view_setToolMode         (PyObject *self, PyObject *args);

struct AnimModView {
    PyObject_HEAD
    View *m_view;
};

static PyTypeObject s_viewType = {
    PyObject_HEAD_INIT(NULL)
    0,
    "Model",
    sizeof(AnimModView),
    0,
    s_view_dealloc,     /* tp_dealloc     */
    0,                  /* tp_print       */
    s_view_getAttr,     /* tp_getattr     */
    0,                  /* tp_setattr     */
    0,                  /* tp_compare     */
    0,                  /* tp_repr        */
    0,                  /* tp_as_number   */
    0,                  /* tp_as_sequence */
    0,                  /* tp_as_mapping  */
    0,                  /* tp_hash        */
};

#define MV METH_VARARGS
static PyMethodDef s_viewMethods[] = {
    {"setPosition"       , (PyCFunction)s_view_setPosition,         MV, ""},
    {"setDirection"      , (PyCFunction)s_view_setDirection,        MV, ""},
    {"initGL"            , (PyCFunction)s_view_initGL,              MV, ""},
    {"draw"              , (PyCFunction)s_view_draw,                MV, ""},
    {"setSize"           , (PyCFunction)s_view_setSize,             MV, ""},
    {"addViewListener"   , (PyCFunction)s_view_addViewListener,     MV, ""},
    //{"removeViewListener", (PyCFunction)s_view_removeViewListener,  MV, ""},
    {"addStatusListener" , (PyCFunction)s_view_addStatusListener,   MV, ""},
    //{"removeViewListener", (PyCFunction)s_view_removeStatusListener,MV, ""},
    {"setCurrent"        , (PyCFunction)s_view_setCurrent,          MV, ""},
    {"navMouseDown"      , (PyCFunction)s_view_navMouseDown,        MV, ""},
    {"navMouseMove"      , (PyCFunction)s_view_navMouseMove,        MV, ""},
    {"navMouseUp"        , (PyCFunction)s_view_navMouseUp,          MV, ""},
    {"mouseDown"         , (PyCFunction)s_view_mouseDown,           MV, ""},
    {"mouseMove"         , (PyCFunction)s_view_mouseMove,           MV, ""},
    {"mouseUp"           , (PyCFunction)s_view_mouseUp,             MV, ""},
    {"getToolMode"       , (PyCFunction)s_view_getToolMode,         MV, ""},
    {"setToolMode"       , (PyCFunction)s_view_setToolMode,         MV, ""},
};
#undef MV

/*** Anim declarations. */

static void s_anim_dealloc(PyObject *self);
static PyObject *s_anim_getAttr(PyObject *self, char *name);

static PyObject *s_anim_setCurrent        (PyObject *self, PyObject *args);
static PyObject *s_anim_addAnimListener   (PyObject *self, PyObject *args);
//static PyObject *s_anim_removeAnimListener(PyObject *self, PyObject *args);
static PyObject *s_anim_modified          (PyObject *self, PyObject *args);
static PyObject *s_anim_getBoneIDs        (PyObject *self, PyObject *args);
static PyObject *s_anim_getKeyTimes       (PyObject *self, PyObject *args);
static PyObject *s_anim_getKeyInfoAtTime  (PyObject *self, PyObject *args);
static PyObject *s_anim_removeKey         (PyObject *self, PyObject *args);
static PyObject *s_anim_addKey            (PyObject *self, PyObject *args);

struct AnimModAnim {
    PyObject_HEAD
    Anim *m_anim;
};

static PyTypeObject s_animType = {
    PyObject_HEAD_INIT(NULL)
    0,
    "Anim",
    sizeof(AnimModAnim),
    0,
    s_anim_dealloc,     /* tp_dealloc     */
    0,                  /* tp_print       */
    s_anim_getAttr,     /* tp_getattr     */
    0,                  /* tp_setattr     */
    0,                  /* tp_compare     */
    0,                  /* tp_repr        */
    0,                  /* tp_as_number   */
    0,                  /* tp_as_sequence */
    0,                  /* tp_as_mapping  */
    0,                  /* tp_hash        */
};

#define MV METH_VARARGS
static PyMethodDef s_animMethods[] = {
    {"setCurrent"        , (PyCFunction)s_anim_setCurrent,         MV, ""},
    {"addAnimListener"   , (PyCFunction)s_anim_addAnimListener,    MV, ""},
    //{"removeAnimListener", (PyCFunction)s_anim_removeAnimListener, MV, ""},
    {"modified"          , (PyCFunction)s_anim_modified,           MV, ""},
    {"getBoneIDs"        , (PyCFunction)s_anim_getBoneIDs,         MV, ""},
    {"getKeyTimes"       , (PyCFunction)s_anim_getKeyTimes,        MV, ""},
    {"getKeyInfoAtTime"  , (PyCFunction)s_anim_getKeyInfoAtTime,   MV, ""},
    {"removeKey"         , (PyCFunction)s_anim_removeKey,          MV, ""},
    {"addKey"            , (PyCFunction)s_anim_addKey,             MV, ""},
};
#undef MV

/*** Mechanism to kill views when model is freed. */

typedef std::vector<AnimModView *> ViewVector;
typedef std::map<AnimModModel *, ViewVector > ModelViewMap;
static ModelViewMap s_modelViewMap;

static void s_freeView(AnimModView *v) {
    if(!(v->m_view->getModel()->freeView(v->m_view))) {
        printf("Warning: couldn't free view (%s:%d)\n", __FILE__, __LINE__);
        fflush(stdout);
    }
}

static void s_freeViews(AnimModModel *model) {
    ViewVector v = s_modelViewMap[model];
    s_modelViewMap.erase(s_modelViewMap.find(model));
    for(int i = 0; i < (int) v.size(); i ++) {
        s_freeView(v[i]);
        v[i]->m_view = 0;
    }
}

static void s_addView(AnimModModel *model, AnimModView *view) {
    s_modelViewMap[model].push_back(view);
}

static void s_removeView(AnimModView *view) {
    if(view->m_view == 0) return;
    ModelViewMap::iterator mvmi;
    for(mvmi = s_modelViewMap.begin(); mvmi != s_modelViewMap.end(); ++ mvmi) {
        ViewVector &vv = (*mvmi).second;
        ViewVector::iterator vvi;
        for(vvi = vv.begin(); vvi != vv.end(); ++ vvi) {
            if(*vvi == view) {
                vv.erase(vvi);
                return;
            }
        }
    }
    printf("Warning: couldn't find view in models (%s:%d)\n", __FILE__, __LINE__); fflush(stdout);
    //s_freeView(view);
}

/*** Mechanism to kill anims when model is freed. */

typedef std::vector<AnimModAnim *> AnimVector;
typedef std::map<AnimModModel *, AnimVector > ModelAnimMap;
static ModelAnimMap s_modelAnimMap;

static void s_freeAnim(AnimModAnim *a) {
    if(!(a->m_anim->getModel()->freeAnim(a->m_anim))) {
        printf("Warning: couldn't free anim (%s:%d)\n", __FILE__, __LINE__);
        fflush(stdout);
    }
}

static void s_freeAnims(AnimModModel *model) {
    AnimVector v = s_modelAnimMap[model];
    s_modelAnimMap.erase(s_modelAnimMap.find(model));
    for(int i = 0; i < (int) v.size(); i ++) {
        s_freeAnim(v[i]);
        v[i]->m_anim = 0;
    }
}

static void s_addAnim(AnimModModel *model, AnimModAnim *anim) {
    s_modelAnimMap[model].push_back(anim);
}

static void s_removeAnim(AnimModAnim *anim) {
    if(anim->m_anim == 0) return;
    ModelAnimMap::iterator mami;
    for(mami = s_modelAnimMap.begin(); mami != s_modelAnimMap.end(); ++ mami) {
        AnimVector &av = (*mami).second;
        AnimVector::iterator avi;
        for(avi = av.begin(); avi != av.end(); ++ avi) {
            if(*avi == anim) {
                av.erase(avi);
                return;
            }
        }
    }
    printf("Warning: couldn't find anim in models (%s:%d)\n", __FILE__, __LINE__); fflush(stdout);
    //s_freeAnim(anim);
}

// Returns the python object associated with the given model and animation,
// creating a new object if necessary.  Object is returned with preincremented
// reference count.
static AnimModAnim *s_getAnim(AnimModModel *model, Anim *anim) {
    if(s_modelAnimMap.find(model) != s_modelAnimMap.end()) {
        AnimVector &av = s_modelAnimMap[model];
        AnimVector::iterator avi;
        for(avi = av.begin(); avi != av.end(); ++ avi) {
            if((*avi)->m_anim == anim) {
                Py_INCREF((PyObject *) *avi);
                return *avi;
            }
        }
    }
    // If anim not found, make a new python object and add it to the list.
    AnimModAnim *ama = PyObject_New(AnimModAnim, &s_animType);;
    ama->m_anim = anim;
    s_addAnim(model, ama);
    return ama;
}

/*** Model implementation. */

static AnimModModel *s_castModel(PyObject *obj, const char *param) {
    if(!PyObject_TypeCheck(obj, &s_modelType)) {
        PyErr_Format(PyExc_ValueError, "'%s' is not a Model object.", param);
        return NULL;
    }
    return (AnimModModel *) obj;
}

static PyObject *s_model_new(PyObject *self, PyObject *args) {
    AnimModModel *m;

    if(!PyArg_ParseTuple(args, ":Model")) return NULL;

    m = PyObject_New(AnimModModel, &s_modelType);
    m->m_model = new Model();
    if(m->m_model == NULL) {
        return PyErr_NoMemory();
    }
    return (PyObject *) m;
}

static void s_model_dealloc(PyObject *self) {
    AnimModModel *m = (AnimModModel *) self;
    s_freeViews(m);
    s_freeAnims(m);
    delete m->m_model;
    PyObject_Del(self);
    printf("freed model object (%s:%d)\n", __FILE__, __LINE__); fflush(stdout);
}

static PyObject *s_model_getAttr(PyObject *self, char *name) {
    return Py_FindMethod(s_modelMethods, (PyObject *)self, name);
}

static PyObject *s_model_loadMesh(PyObject *self, PyObject *args) {
    char *filename;
    if(!PyArg_ParseTuple(args, "s:model_loadMesh", &filename)) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    if(!m->m_model->loadMesh(filename)) {
        PyErr_Format(PyExc_IOError, "Couldn't load mesh file '%s': %s",
                     filename, m->m_model->getErrorString());
        return NULL;
    }
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_model_loadSkeleton(PyObject *self, PyObject *args) {
    char *filename;
    if(!PyArg_ParseTuple(args, "s:model_loadSkeleton", &filename)) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    if(!m->m_model->loadSkeleton(filename)) {
        PyErr_Format(PyExc_IOError, "Couldn't load skeleton file '%s': %s",
                     filename, m->m_model->getErrorString());
        return NULL;
    }
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_model_addUndoListener(PyObject *self, PyObject *args) {
    PyObject *obj;
    if(!PyArg_ParseTuple(args, "O:view_addUndoListener", &obj)) {
        return NULL;
    }
    if(!PyCallable_Check(obj)) {
        PyErr_Format(PyExc_ValueError, "listener is not a callable object.");
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    m->m_model->addUndoListener(new UndoListenerImpl(obj));
    Py_INCREF(Py_None);
    return Py_None;
}

/*static PyObject *s_model_removeUndoListener(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}*/

static PyObject *s_model_modified(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_modified")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    int modified = (m->m_model->modified() ? 1 : 0);
    return Py_BuildValue("i", modified);
}

static PyObject *s_model_pushUndoToken(PyObject *self, PyObject *args) {
    char *name;
    if(!PyArg_ParseTuple(args, "s:model_pushUndoToken", &name)) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    m->m_model->pushUndoToken(name);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_model_canUndo(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_canUndo")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    int canUndo = (m->m_model->canUndo() ? 1 : 0);
    return Py_BuildValue("i", canUndo);
}

static PyObject *s_model_canRedo(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_canRedo")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    int canRedo = (m->m_model->canRedo() ? 1 : 0);
    return Py_BuildValue("i", canRedo);
}

static PyObject *s_model_getUndoName(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_getUndoName")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    const char *undoName = m->m_model->getUndoName();
    return Py_BuildValue("s", undoName);
}

static PyObject *s_model_getRedoName(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_getRedoName")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    const char *redoName = m->m_model->getRedoName();
    return Py_BuildValue("s", redoName);
}

static PyObject *s_model_undo(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_undo")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    m->m_model->undo();
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_model_redo(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_redo")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    m->m_model->redo();
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_model_newView(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_newView")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    AnimModView *v = s_view_new(m);
    return (PyObject *) v;
}

static PyObject *s_model_getNumAnims(PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":model_getNumAnims")) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    return Py_BuildValue("i", m->m_model->getNumAnims());
}

static PyObject *s_model_getAnim(PyObject *self, PyObject *args) {
    int index;
    if(!PyArg_ParseTuple(args, "i:model_getAnim", &index)) {
        return NULL;
    }
    AnimModModel *amm = s_castModel(self, "self");
    if(!amm) return NULL;
    Anim *anim = amm->m_model->getAnim(index);
    if(anim == NULL) {
        Py_INCREF(Py_None);
        return Py_None;
    }
    AnimModAnim *ama = s_getAnim(amm, anim);
    return (PyObject *) ama;
}

static PyObject *s_model_loadAnim(PyObject *self, PyObject *args) {
    char *filename;
    if(!PyArg_ParseTuple(args, "s:model_loadAnim", &filename)) {
        return NULL;
    }
    AnimModModel *m = s_castModel(self, "self");
    if(!m) return NULL;
    Anim *anim = m->m_model->loadAnim(filename);
    if(anim == NULL) {
        PyErr_Format(PyExc_IOError, "Couldn't load anim file '%s': %s",
                     filename, m->m_model->getErrorString());
        return NULL;
    }
    AnimModAnim *ama = s_getAnim(m, anim);
    return (PyObject *) ama;
}

static PyObject *s_model_newAnim(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_getKeyInfo(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_getNumBones(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_getBoneInfo(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

/*** View implementation. */

static AnimModView *s_castView(PyObject *obj, const char *param) {
    if(!PyObject_TypeCheck(obj, &s_viewType)) {
        PyErr_Format(PyExc_ValueError, "'%s' is not a View object.", param);
        return NULL;
    }
    // Check to see if view has been deallocated (because model
    // was deallocated).
    AnimModView *v = (AnimModView *) obj;
    if(v->m_view == 0) {
        PyErr_Format(PyExc_ValueError,
                     "The View object '%s' is no longer valid.", param);
        return NULL;
    }

    return v;
}

static AnimModView *s_view_new(AnimModModel *model) {
    AnimModView *v;

    v = PyObject_New(AnimModView, &s_viewType);
    v->m_view = model->m_model->newView();
    s_addView(model, v);
    return v;
}

static void s_view_dealloc(PyObject *self) {
    AnimModView *v = (AnimModView *) self;
    s_removeView(v);
    PyObject_Del(self);
    printf("freed view (%s:%d)\n", __FILE__, __LINE__); fflush(stdout);
}

static PyObject *s_view_getAttr(PyObject *self, char *name) {
    return Py_FindMethod(s_viewMethods, (PyObject *)self, name);
}

static PyObject *s_view_setPosition       (PyObject *self, PyObject *args) {
    float posX, posY, posZ;
    if(!PyArg_ParseTuple(args, "(fff):view_setPosition",
                         &posX, &posY, &posZ)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->setPosition(IPoint(posX, posY, posZ));
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_setDirection      (PyObject *self, PyObject *args) {
    float dirX, dirY, dirZ;
    if(!PyArg_ParseTuple(args, "(fff):view_setDirection",
                         &dirX, &dirY, &dirZ)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->setDirection(IVector(dirX, dirY, dirZ));
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_initGL            (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":view_initGL")) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->initGL();
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_draw              (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":view_draw")) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->draw();
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_setSize           (PyObject *self, PyObject *args) {
    int w, h;
    if(!PyArg_ParseTuple(args, "ii:view_setSize", &w, &h)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->setSize(w, h);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_addViewListener   (PyObject *self, PyObject *args) {
    PyObject *obj;
    if(!PyArg_ParseTuple(args, "O:view_addViewListener", &obj)) {
        return NULL;
    }
    if(!PyCallable_Check(obj)) {
        PyErr_Format(PyExc_ValueError, "listener is not a callable object.");
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->addViewListener(new ViewListenerImpl(obj));
    Py_INCREF(Py_None);
    return Py_None;
}

/*static PyObject *s_view_removeViewListener(PyObject *self, PyObject *args) {
    PyObject *obj;
    if(!PyArg_ParseTuple(args, "O:view_removeViewListener", &obj)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    ViewListenerImpl vli(obj);
    v->m_view->removeViewListener(&vli);
    Py_INCREF(Py_None);
    return Py_None;
}*/

static PyObject *s_view_addStatusListener (PyObject *self, PyObject *args) {
    PyObject *obj;
    if(!PyArg_ParseTuple(args, "O:view_addStatusListener", &obj)) {
        return NULL;
    }
    if(!PyCallable_Check(obj)) {
        PyErr_Format(PyExc_ValueError, "listener is not a callable object.");
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->addStatusListener(new StatusListenerImpl(obj));
    Py_INCREF(Py_None);
    return Py_None;
}

/*static PyObject *s_view_removeStatusListener(PyObject *self, PyObject *args) {
    PyObject *obj;
    if(!PyArg_ParseTuple(args, "O:view_removeStatusListener", &obj)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    StatusListenerImpl vli(obj);
    v->m_view->removeStatusListener(&vli);
    Py_INCREF(Py_None);
    return Py_None;
}*/

static PyObject *s_view_setCurrent        (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":view_setCurrent")) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->setCurrent();
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_navMouseDown      (PyObject *self, PyObject *args) {
    int x, y;
    if(!PyArg_ParseTuple(args, "ii:view_navMouseDown", &x, &y)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->navMouseDown(x, y);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_navMouseMove      (PyObject *self, PyObject *args) {
    int x, y;
    if(!PyArg_ParseTuple(args, "ii:view_navMouseMove", &x, &y)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->navMouseMove(x, y);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_navMouseUp        (PyObject *self, PyObject *args) {
    int x, y;
    if(!PyArg_ParseTuple(args, "ii:view_navMouseUp", &x, &y)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->navMouseUp(x, y);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_mouseDown         (PyObject *self, PyObject *args) {
    int x, y;
    if(!PyArg_ParseTuple(args, "ii:view_mouseDown", &x, &y)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->mouseDown(x, y);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_mouseMove         (PyObject *self, PyObject *args) {
    int x, y;
    if(!PyArg_ParseTuple(args, "ii:view_mouseMove", &x, &y)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->mouseMove(x, y);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_mouseUp           (PyObject *self, PyObject *args) {
    int x, y;
    if(!PyArg_ParseTuple(args, "ii:view_mouseUp", &x, &y)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->mouseUp(x, y);
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_getToolMode    (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":view_getToolMode")) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    int toolMode = v->m_view->getToolMode();
    return Py_BuildValue("i", toolMode);
}

static PyObject *s_view_setToolMode    (PyObject *self, PyObject *args) {
    int toolMode;
    if(!PyArg_ParseTuple(args, "i:view_setToolMode",
                         &toolMode)) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->setToolMode(toolMode);
    Py_INCREF(Py_None);
    return Py_None;
}

/*** Anim implementation. */

/*static PyObject *s_anim_new(PyObject *self, PyObject *args) {
    AnimModAnim *m;

    if(!PyArg_ParseTuple(args, ":Anim")) return NULL;

    m = PyObject_New(AnimModAnim, &s_animType);
    return (PyObject *) m;
}*/

static AnimModAnim *s_castAnim(PyObject *obj, const char *param) {
    if(!PyObject_TypeCheck(obj, &s_animType)) {
        PyErr_Format(PyExc_ValueError, "'%s' is not a Anim object.", param);
        return NULL;
    }
    return (AnimModAnim *) obj;
}

static void s_anim_dealloc(PyObject *self) {
    AnimModAnim *ama = (AnimModAnim *) self;
    s_removeAnim(ama);
    PyObject_Del(self);
    printf("freed anim (%s:%d)\n", __FILE__, __LINE__); fflush(stdout);
}

static PyObject *s_anim_getAttr(PyObject *self, char *name) {
    return Py_FindMethod(s_animMethods, (PyObject *)self, name);
}

static PyObject *s_anim_setCurrent        (PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
}

static PyObject *s_anim_addAnimListener   (PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
}

/*static PyObject *s_anim_removeAnimListener(PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
}*/

static PyObject *s_anim_modified          (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":anim_modified")) {
        return NULL;
    }
    AnimModAnim *a = s_castAnim(self, "self");
    if(!a) return NULL;
    int modified = (a->m_anim->modified() ? 1 : 0);
    return Py_BuildValue("i", modified);
}

static PyObject *s_anim_getBoneIDs        (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":getBoneIDs")) {
        return NULL;
    }
    AnimModAnim *a = s_castAnim(self, "self");
    if(!a) return NULL;
    IntVector ids;
    a->m_anim->getBoneIDs(ids);
    PyObject *idsObj = PyList_New(ids.size());
    for(int i = 0; i < (int) ids.size(); i ++) {
        PyList_SET_ITEM(idsObj, i, PyInt_FromLong((long) ids[i]));
    }
    return idsObj;
}

static PyObject *s_anim_getKeyTimes       (PyObject *self, PyObject *args) {
    int boneID;
    float startTime=0.0f, endTime=-1.0f;
    if(!PyArg_ParseTuple(args, "i|ff:getKeyTimes", &boneID,
                         &startTime, &endTime)) {
        return NULL;
    }
    AnimModAnim *a = s_castAnim(self, "self");
    if(!a) return NULL;
    FloatVector times;
    a->m_anim->getKeyTimes(boneID, times, startTime, endTime);
    PyObject *timesObj = PyList_New(times.size());
    for(int i = 0; i < (int) times.size(); i ++) {
        PyList_SET_ITEM(timesObj, i, PyFloat_FromDouble((double) times[i]));
    }
    return timesObj;
}

static PyObject *s_anim_getKeyInfoAtTime  (PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
}

static PyObject *s_anim_removeKey         (PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
}

static PyObject *s_anim_addKey            (PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
}


/*static PyObject *func(PyObject *self, PyObject *args) {
    char *s;
    int retval = 0;

    if(!PyArg_ParseTuple(args, "s", &s)) {
        return NULL;
    }
    printf("Hello, '%s'\n", s);
    fflush(stdout);
    return Py_BuildValue("i", retval);
}*/

static PyMethodDef s_animModMethods[] = {
    {"Model", s_model_new, METH_VARARGS, ""},
    {NULL, NULL, 0, NULL}
};

extern "C" void initanimmod() {
    PyObject *m, *d;

    m = Py_InitModule("animmod", s_animModMethods);
    d = PyModule_GetDict(m);
    s_animError = PyErr_NewException("animmod.error", NULL, NULL);
    PyDict_SetItemString(d, "error", s_animError);
}
