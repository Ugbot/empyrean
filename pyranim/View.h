#ifndef INCLUDED_VIEW_H
#define INCLUDED_VIEW_H

#include <vector>
#include "IAlgebra.h"
#include "RotWidget.h"

class ViewListener {
public:
    virtual ~ViewListener() {}
    virtual void notify() = 0;
};
typedef std::vector<ViewListener*> ViewListenerList;

class StatusListener {
public:
    virtual ~StatusListener() {}
    virtual void notify(const char *msg) = 0;
};
typedef std::vector<StatusListener*> StatusListenerList;

class Model;
class Camera;

class View : public RotWidgetListener {
public:
    View(Model *model);
    ~View();
    void setPosition(const IPoint &p);
    void setDirection(const IVector &v);
    void initGL();
    void draw();
    void setSize(int w, int h);
    void addViewListener(ViewListener *listener);
    void addStatusListener(StatusListener *listener);
    void setCurrent();
    void navMouseDown(int x, int y);
    void navMouseMove(int x, int y);
    void navMouseUp(int x, int y);
    void mouseDown(int x, int y);
    void mouseMove(int x, int y);
    void mouseUp(int x, int y);

    int getToolMode() const;
    void setToolMode(int tool);

    void notifyViewListeners();

    int getWidth () const { return m_width ; }
    int getHeight() const { return m_height; }
    const Camera &getCamera() const { return *m_camera; }
    void redraw();
    void rotWidgetChanged(RotWidget *widget, const IQuat &quat, bool final);

    Model *getModel() { return m_model; }

protected:
    static const int NAV_OFF      = 0;
    static const int NAV_SELECT   = 1;
    static const int NAV_ROTATING = 2;
    static const int NAV_PANNING  = 3;
    static const int NAV_ZOOMING  = 4;

    static const int TOOL_SELECT  = 0;
    static const int TOOL_ROTATE  = 1;

    Model *m_model;
    Camera *m_camera;
    RotWidget *m_rotWidget;
    bool m_rotWidgetActive;
    int m_width;
    int m_height;
    double m_groundRes;
    ViewListenerList   m_viewListeners;
    StatusListenerList m_statusListeners;
    int m_navMode;
    int m_toolMode;
    double m_navCircleRad;
    double m_navCircleX;
    double m_navCircleY;
    double m_navPrevX;
    double m_navPrevY;
    int m_selectedJoint;
    IMatrix m_modelTransform;

    void drawGroundPlane() const;
    void drawSkeleton();
    void drawNavCircle() const;
    void notifyStatusListeners(const char *msg);
    void recalcNavCircle();
    double getViewDepth() const;

    int getClickedJoint(int x, int y);
    void updateRotWidget();

private:
    // Not implemented:
    View(const View &);
    View &operator=(const View &);
};

#endif
