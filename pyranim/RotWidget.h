#ifndef INCLUDED_ROTWIDGET_H
#define INCLUDED_ROTWIDGET_H

#include "IAlgebra.h"
#include <vector>

class Camera;
class RotWidget;

// Interface that should be implemented by the Listener.
class RotWidgetListener {
public:
    virtual ~RotWidgetListener() {}
    virtual int getWidth()  const = 0;
    virtual int getHeight() const = 0;
    virtual const Camera &getCamera() const = 0;
    virtual void redraw() = 0;
    virtual void rotWidgetChanged(RotWidget *, const IPoint &quat) = 0;
};

struct RWPoint {
    IPoint m_worldPoint;
    IPoint m_screenPoint;
    bool m_back;
};

class RotWidget {
public:
    RotWidget();
    virtual ~RotWidget();

    void draw();
    void setLocation(const IPoint &loc);
    void setRotation(const IQuat &quat);
    void setListener(RotWidgetListener *listener);
    const IQuat &getRotation() const;
    const IPoint &getLocation() const;

    void setRadius(double r);
    double getRadius() const;

    bool mouseDown(int x, int y);
    bool mouseMove(int x, int y);
    bool mouseUp(int x, int y);
    
protected:
    IQuat m_quat;
    IPoint m_loc;
    RotWidgetListener *m_listener;
    double m_radius;
    int m_selAxis;
    bool m_mouseDown;

    typedef std::vector<RWPoint> RWPointVector;
    RWPointVector m_points[4];

    typedef std::pair<int, int> IntPair;
    IntPair getClosestPoint(int x, int y, double maxDist);

    void refreshRWPoints();

private:
    // Not implemented:
    RotWidget(const RotWidget &);
    RotWidget &operator=(const RotWidget &);
};

#endif
