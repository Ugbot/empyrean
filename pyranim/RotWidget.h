#ifndef INCLUDED_ROTWIDGET_H
#define INCLUDED_ROTWIDGET_H

#include "IAlgebra.h"

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

class RotWidget {
public:
    RotWidget();
    virtual ~RotWidget();

    void draw();
    void setLocation(const IPoint &loc);
    void setRotation(const IPoint &quat);
    void setListener(RotWidgetListener *listener);

    bool mouseDown(int x, int y);
    bool mouseMove(int x, int y);
    bool mouseUp(int x, int y);
    
protected:
    IPoint m_quat;
    IPoint m_loc;
    RotWidgetListener *m_listener;

private:
    // Not implemented:
    RotWidget(const RotWidget &);
    RotWidget &operator=(const RotWidget &);
};

#endif
