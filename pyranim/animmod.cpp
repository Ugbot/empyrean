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

class ToolListenerImpl : public ToolListener {
public:
    ToolListenerImpl(PyObject *obj) {
        m_obj = obj;
        Py_INCREF(m_obj);
    }
    virtual ~ToolListenerImpl() {
        Py_DECREF(m_obj);
    }
    virtual void notify(int newTool) {
        if(PyObject_CallFunction(m_obj, "i", newTool) == 0) {
            printf("ToolListenerImpl CallFunction failed.\n");
            fflush(stdout);
        }
    }
protected:
    PyObject *m_obj;
private:
    // Not implemented:
    ToolListenerImpl(const ToolListenerImpl &);
    ToolListenerImpl& operator=(const ToolListenerImpl &);
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
static PyObject *s_view_addToolListener     (PyObject *self, PyObject *args);
static PyObject *s_view_setCurrent          (PyObject *self, PyObject *args);
static PyObject *s_view_navMouseDown        (PyObject *self, PyObject *args);
static PyObject *s_view_navMouseMove        (PyObject *self, PyObject *args);
static PyObject *s_view_navMouseUp          (PyObject *self, PyObject *args);
static PyObject *s_view_mouseDown           (PyObject *self, PyObject *args);
static PyObject *s_view_mouseMove           (PyObject *self, PyObject *args);
static PyObject *s_view_mouseUp             (PyObject *self, PyObject *args);

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
    {"addToolListener"   , (PyCFunction)s_view_addToolListener,     MV, ""},
    {"setCurrent"        , (PyCFunction)s_view_setCurrent,          MV, ""},
    {"navMouseDown"      , (PyCFunction)s_view_navMouseDown,        MV, ""},
    {"navMouseMove"      , (PyCFunction)s_view_navMouseMove,        MV, ""},
    {"navMouseUp"        , (PyCFunction)s_view_navMouseUp,          MV, ""},
    {"mouseDown"         , (PyCFunction)s_view_mouseDown,           MV, ""},
    {"mouseMove"         , (PyCFunction)s_view_mouseMove,           MV, ""},
    {"mouseUp"           , (PyCFunction)s_view_mouseUp,             MV, ""},
};
#undef MV

/*** Anim declarations. */

static void s_anim_dealloc(PyObject *self);
static PyObject *s_anim_getAttr(PyObject *self, char *name);

static PyObject *s_anim_setCurrent        (PyObject *self, PyObject *args);
static PyObject *s_anim_addAnimListener   (PyObject *self, PyObject *args);
//static PyObject *s_anim_removeAnimListener(PyObject *self, PyObject *args);
static PyObject *s_anim_getKeyTimes       (PyObject *self, PyObject *args);
static PyObject *s_anim_getKeyInfoAtTime  (PyObject *self, PyObject *args);
static PyObject *s_anim_removeKey         (PyObject *self, PyObject *args);
static PyObject *s_anim_addKey            (PyObject *self, PyObject *args);

struct AnimModAnim {
    PyObject_HEAD
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
    {"getKeyTimes"       , (PyCFunction)s_anim_getKeyTimes,        MV, ""},
    {"getKeyInfoAtTime"  , (PyCFunction)s_anim_getKeyInfoAtTime,   MV, ""},
    {"removeKey"         , (PyCFunction)s_anim_removeKey,          MV, ""},
    {"addKey"            , (PyCFunction)s_anim_addKey,             MV, ""},
};
#undef MV

/*** Mechanism to kill views after model is freed. */

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
    s_freeView(view);
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
    delete m->m_model;
    PyObject_Del(self);
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
    return NULL;  // XXX - Implement me.
}

/*static PyObject *s_model_removeUndoListener(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}*/

static PyObject *s_model_modified(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_pushUndoToken(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_canUndo(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_canRedo(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_getUndoName(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_getRedoName(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_undo(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_redo(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
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
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_getAnim(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
}

static PyObject *s_model_loadAnim(PyObject *self, PyObject *args) {
    return NULL;  // XXX - Implement me.
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
    v->m_view->setDirection(IVector(dirX, dirY, dirZ));
    Py_INCREF(Py_None);
    return Py_None;
}

static PyObject *s_view_initGL            (PyObject *self, PyObject *args) {
    if(!PyArg_ParseTuple(args, ":view_initGL")) {
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
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

static PyObject *s_view_addToolListener (PyObject *self, PyObject *args) {
    PyObject *obj;
    if(!PyArg_ParseTuple(args, "O:view_addToolListener", &obj)) {
        return NULL;
    }
    if(!PyCallable_Check(obj)) {
        PyErr_Format(PyExc_ValueError, "listener is not a callable object.");
        return NULL;
    }
    AnimModView *v = s_castView(self, "self");
    if(!v) return NULL;
    v->m_view->addToolListener(new ToolListenerImpl(obj));
    Py_INCREF(Py_None);
    return Py_None;
}

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


/*** Anim implementation. */

/*static PyObject *s_anim_new(PyObject *self, PyObject *args) {
    AnimModAnim *m;

    if(!PyArg_ParseTuple(args, ":Anim")) return NULL;

    m = PyObject_New(AnimModAnim, &s_animType);
    return (PyObject *) m;
}*/

static void s_anim_dealloc(PyObject *self) {
    PyObject_Del(self);
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

static PyObject *s_anim_getKeyTimes       (PyObject *self, PyObject *args) {
    return NULL; // XXX - Implement me.
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
