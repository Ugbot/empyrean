#include "RotWidget.h"
#include "Camera.h"
#include <stdio.h>

static const int NUM_RWPOINTS  = 40;
static const int RW_FUDGE_DIST = 10;

RotWidget::RotWidget() {
    m_listener  = NULL;
    m_radius    = 0.05;
    m_selAxis   = -1;
    m_mouseDown = false;

    for(int i = 0; i < 4; i ++) {
        for(int j = 0; j < NUM_RWPOINTS; j ++) {
            m_points[i].push_back(RWPoint());
        }
    }
}

RotWidget::~RotWidget() {
}

void RotWidget::draw() {
    glDisable(GL_LIGHTING);
    glDisable(GL_DEPTH_TEST);
    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();

    IPoint colors[4];
    colors[0] = IPoint(1, 0, 0);
    colors[1] = IPoint(0, 1, 0);
    colors[2] = IPoint(0, 0, 1);
    colors[3] = IPoint(1, 1, 0);

    if(m_selAxis != -1) {
        // Mix non-selected axes' colors with grey.
        for(int i = 0; i < 4; i ++) {
            if(i != m_selAxis) {
                /*colors[i] = ((colors[i] - IPoint()) * 0.3 +
                             IVector(0.4, 0.4, 0.4) * 0.7) +
                            IPoint();*/
                colors[i] = IPoint(0.5, 0.5, 0.5);
            }
        }
    }
    
    // Mix colors with grey to get back-facing colors.
    IPoint backColors[4];
    for(int i = 0; i < 4; i ++) {
        backColors[i] = ((colors[i] - IPoint()) * 0.3 +
                         IVector(0.5, 0.5, 0.5) * 0.7) +
                        IPoint();
    }

    // Draw back points.
    for(int i = 0; i < 4; i ++) {
        glColor3dv(backColors[i].getData());
        glBegin(GL_LINES);
        for(int j = 0; j < (int) m_points[i].size()-1; j ++) {
            const RWPoint &r1 = m_points[i][j];
            const RWPoint &r2 = m_points[i][j+1];
            if(r1.m_back && r2.m_back) {
                glVertex3dv(r1.m_screenPoint.getData());
                glVertex3dv(r2.m_screenPoint.getData());
            }
        }
        glEnd();
    }

    // Draw front points.
    for(int i = 0; i < 4; i ++) {
        glColor3dv(colors[i].getData());
        glBegin(GL_LINES);
        for(int j = 0; j < (int) m_points[i].size()-1; j ++) {
            const RWPoint &r1 = m_points[i][j];
            const RWPoint &r2 = m_points[i][j+1];
            if(!r1.m_back || !r2.m_back) {
                glVertex3dv(r1.m_screenPoint.getData());
                glVertex3dv(r2.m_screenPoint.getData());
            }
        }
        glEnd();
    }


    glMatrixMode(GL_PROJECTION);
    glPopMatrix();

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LIGHTING);
}

void RotWidget::setLocation(const IPoint &loc) {
    m_loc = loc;
    refreshRWPoints();
    if(m_listener) m_listener->redraw();
}

void RotWidget::setRotation(const IQuat &quat) {
    m_quat = quat;
    refreshRWPoints();
    if(m_listener) m_listener->redraw();
}

void RotWidget::setListener(RotWidgetListener *listener) {
    m_listener = listener;
}

const IQuat &RotWidget::getRotation() const {
    return m_quat;
}

const IPoint &RotWidget::getLocation() const {
    return m_loc;
}

void RotWidget::setRadius(double r) {
    m_radius = r;
    refreshRWPoints();
    if(m_listener) m_listener->redraw();
}

double RotWidget::getRadius() const {
    return m_radius;
}

bool RotWidget::mouseDown(int x, int y) {
    //printf("RotWidget::mouseDown\n"); fflush(stdout);
    IntPair ip = getClosestPoint(x, y, RW_FUDGE_DIST);
    if(ip.first == -1) return false;
    m_mouseDown = true;
    m_selAxis = ip.first;
    if(m_listener) m_listener->redraw();
    return true;
}

bool RotWidget::mouseMove(int x, int y) {
    //printf("RotWidget::mouseMove\n"); fflush(stdout);
    return false;
}

bool RotWidget::mouseUp(int x, int y) {
    if(!m_mouseDown) return false;

    m_mouseDown = false;
    m_selAxis = -1;
    if(m_listener) m_listener->redraw();
    return true;
}

void RotWidget::refreshRWPoints() {
    IMatrix m = quat_to_mat(m_quat);

    IMatrix projMat = m_listener->getCamera().getWorldToFilm();
    IPoint eye = m_listener->getCamera().getEye();
    IVector dir = m_loc - eye;
    if(length(dir) < IALGEBRA_EPSILON) {
        dir = m_listener->getCamera().getLook();
    }
    if(length(dir) < IALGEBRA_EPSILON) {
        // Shouldn't happen.
        dir = IVector(0,0,1);
    } else {
        dir = normalize(dir);
    }
    IVector perpDir = cross(dir, m_listener->getCamera().getUp());
    if(length(perpDir) < IALGEBRA_EPSILON) {
        // Shouldn't happen.
        perpDir = cross(dir, IVector(0,1,0));
        if(length(perpDir) < IALGEBRA_EPSILON) {
            perpDir = cross(dir, IVector(1,0,0));
        }
    }
    perpDir = normalize(perpDir);

    IPoint centerPoint = projMat * m_loc;
    centerPoint.homogenize();

    for(int i = 0; i < NUM_RWPOINTS; i ++) {
        double angle = (double) i / (NUM_RWPOINTS - 1) * M_PI * 2.0;
        for(int j = 0; j < 4; j ++) {
            IVector v;
            IPoint p;
            switch(j) {
            case 0:
                v = IVector(       0.0, cos(angle),  sin(angle)) * m_radius;
                p = m * v + m_loc;
                break;
            case 1:
                v = IVector(cos(angle),        0.0, -sin(angle)) * m_radius;
                p = m * v + m_loc;
                break;
            case 2:
                v = IVector(cos(angle), sin(angle),         0.0) * m_radius;
                p = m * v + m_loc;
                break;
            case 3:
                IMatrix rmat = rot_mat(IPoint(), dir, angle);
                v = rmat * (m_radius * perpDir);
                p = v + m_loc;
                break;
            }
            RWPoint rw;
            rw.m_worldPoint = p;
            rw.m_screenPoint = projMat * p;
            rw.m_screenPoint.homogenize();
            if(j == 3) {
                IVector delta = rw.m_screenPoint - centerPoint;
                rw.m_screenPoint = delta * (1.10) + centerPoint;
                rw.m_back = false;
            } else {
                rw.m_back = rw.m_screenPoint[2] > centerPoint[2];
            }
            m_points[j][i] = rw;
        }
    }
}

RotWidget::IntPair RotWidget::getClosestPoint(int x, int y, double maxDist) {
    if(m_listener == NULL) return IntPair(-1, -1);

    int closestAxisIndex = -1;
    int closestPointIndex = -1;
    double closestDist = 0;
    for(int i = 0; i < 4; i ++) {
        for(int j = 0; j < NUM_RWPOINTS; j ++) {
            if(m_points[i][j].m_back) continue;

            const IPoint &pt = m_points[i][j].m_screenPoint;
            int sx = (int)  ((pt[0] + 1.0) * m_listener->getWidth () / 2.0);
            int sy = (int) -((pt[1] - 1.0) * m_listener->getHeight() / 2.0);
            int deltaX = sx - x;
            int deltaY = sy - y;
            double dist = sqrt(deltaX * deltaX + deltaY * deltaY);
            if(dist > maxDist) continue;

            if(closestPointIndex == -1 ||
               dist < closestDist) {
                closestAxisIndex = i;
                closestPointIndex = j;
                closestDist = dist;
            }
        }
    }

    return IntPair(closestAxisIndex, closestPointIndex);
}

