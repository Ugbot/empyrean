#include <stdio.h>
#include <math.h>
#include <GL/gl.h>
#include <GL/glu.h>
#include "View.h"
#include "Camera.h"
#include "Model.h"
#include "Skeleton.h"

// Number of segments in the navigation hint circle.
static const int    NAV_CIRCLE_SEGS  = 40;

// Width of the navigation hint circle, as a percentage of the screen.
static const double NAV_STRIP_WIDTH  = 0.05;

// Radius of the navigation hint circle, as a percentage of half the screen.
static const double NAV_CIRCLE_RAD   = 0.7;

// Distance in pixels before the application chooses between panning and
// zooming.
static const int    NAV_CHOOSE_LEN   = 5;

// Deflection angle from vertical that indicates zooming.
static const double NAV_CHOOSE_ANGLE = M_PI / 4.0;

// Distance from joint which selects it.
static const int JOINT_FUDGE_DIST = 10;

View::View(Model *model) {
    m_model        = model;
    m_groundRes    = 0.10;
    m_navMode      = NAV_OFF;
    // XXX - for testing purposes.
    m_toolMode     = TOOL_SELECT;
    //m_toolMode     = TOOL_ROTATE;
    m_navCircleRad = 1.0;
    m_navCircleX   = 1.0;
    m_navCircleY   = 1.0;
    m_navPrevX     = 0.0;
    m_navPrevY     = 0.0;
    m_selectedJoint = -1;
    m_modelTransform = scale_mat(0.01, 0.01, 0.01);

    m_camera = new Camera();
    m_camera->orient(IPoint(0, 0, 0),
                     IVector(0, 0, 1),
                     IVector(0, 1, 0));
    m_camera->rotateY(30.0 / 180 * M_PI);
    m_camera->rotateX(30.0 / 180 * M_PI);
    m_camera->translate(IVector(0, 0, 2));
    m_camera->setHeightAngle(30);
    
    m_rotWidget = new RotWidget();
    m_rotWidget->setListener(this);
    m_rotWidgetActive = false;
}

View::~View() {
    for(int i = 0; i < (int) m_viewListeners.size(); i ++) {
        delete m_viewListeners[i];
    }
    for(int i = 0; i < (int) m_statusListeners.size(); i ++) {
        delete m_statusListeners[i];
    }
    delete m_camera;
    delete m_rotWidget;
}

void View::setPosition(const IPoint &p) {
    //m_pos = p;
    // XXX - refresh.
}

void View::setDirection(const IVector &v) {
    //m_dir = v;
    // XXX - refresh.
}

void View::initGL() {
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glFrustum(-0.5, 0.5, -0.5, 0.5, 1.0, 3.0);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0, 0.0, -2.0);
    glRotatef(30, 1.0, 0.0, 0.0);
    glRotatef(30, 0.0, 1.0, 0.0);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glClearColor(0.4, 0.4, 0.4, 1.0);
}

void View::draw() {
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glMultMatrixd(m_camera->getWorldToFilm().getData());

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    drawGroundPlane();
    if(m_navMode == NAV_SELECT ||
       m_navMode == NAV_ROTATING) {
        drawNavCircle();
    }
    drawSkeleton();

    if(m_toolMode == TOOL_ROTATE && m_selectedJoint != -1) {
        m_rotWidget->draw();
    }
}

void View::drawGroundPlane() const {
    IVector gpColor;
    m_model->getGroundPlaneColor(gpColor);
    glColor3dv(gpColor.getData());
    glDisable(GL_LIGHTING);
    glBegin(GL_LINES);
    for(int i = -5; i <= 5; i ++) {
        glVertex3d(   i * m_groundRes, 0.0, -5.0 * m_groundRes);
        glVertex3d(   i * m_groundRes, 0.0,  5.0 * m_groundRes);
        glVertex3d(-5.0 * m_groundRes, 0.0,    i * m_groundRes);
        glVertex3d( 5.0 * m_groundRes, 0.0,    i * m_groundRes);
    }
    glEnd();
    glEnable(GL_LIGHTING);
}

struct JointDrawInfo {
    IPoint m_p[5];
    bool m_parentSelected;
};

void View::drawSkeleton() {
    glDisable(GL_LIGHTING);
    glDisable(GL_DEPTH_TEST);

    IPoint grid[5];
    grid[0] = IPoint( 0,  0, 0);
    grid[1] = IPoint( 0, -1, 0);
    grid[2] = IPoint(-1,  0, 0);
    grid[3] = IPoint( 0,  1, 0);
    grid[4] = IPoint( 1,  0, 0);

    int numJoints = m_model->getNumJoints();
    std::vector<JointDrawInfo> jdis(numJoints + 1);
    for(int i = 0; i < numJoints; i ++) {
        JointDrawInfo &jdi = jdis[i];
        const JointInfo &ji = m_model->getJointInfo(i);
        IMatrix m = m_modelTransform * ji.m_localToGlobalMat;
        for(int j = 0; j < 5; j ++) {
            jdi.m_p[j] = m * grid[j];
        }
        if(ji.m_parent != -1) {
            jdi.m_parentSelected = (ji.m_parent == m_selectedJoint ||
                                    jdis[ji.m_parent].m_parentSelected);
        }
    }
    for(int j = 0; j < 5; j ++) {
        jdis[numJoints].m_p[j] = m_modelTransform * grid[j];
    }
    glBegin(GL_LINES);
    for(int i = 0; i < numJoints; i ++) {
        const JointDrawInfo &jdi = jdis[i];
        const JointInfo &ji = m_model->getJointInfo(i);
        if(m_selectedJoint == i) {
            glColor3d(1.0, 1.0, 1.0);
        } else if(jdi.m_parentSelected) {
            glColor3d(0.25, 0.25, 0.4);
        } else {
            glColor3d(0.1, 0.1, 0.3);
        }
        int pnum = (ji.m_parent == -1 ? numJoints : ji.m_parent);
        for(int j = 0; j < 4; j ++) {
            glVertex3dv(jdis[pnum].m_p[j + 1].getData());
            glVertex3dv(jdi.m_p[0].getData());

            glVertex3dv(jdis[pnum].m_p[j + 1].getData());
            glVertex3dv(jdis[pnum].m_p[((j+1) % 4) + 1].getData());
        }
    }
    glEnd();

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LIGHTING);
}

static void drawRing(double x, double y,
                     double rad1, double rad2,
                     float *color1, float *color2);

void View::drawNavCircle() const {
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_BLEND);
    glDisable(GL_LIGHTING);
    glDisable(GL_DEPTH_TEST);

    glMatrixMode(GL_PROJECTION);
    glPushMatrix();
    glLoadIdentity();
    glMatrixMode(GL_MODELVIEW);
    glPushMatrix();
    glLoadIdentity();

    float white[4] = {1.0, 1.0, 1.0, 0.1};
    float trans[4] = {1.0, 1.0, 1.0, 0.0};
   
    // Draw outside strip.
    drawRing(m_navCircleX, m_navCircleY,
             m_navCircleRad + NAV_STRIP_WIDTH,
             m_navCircleRad,
             trans, white);

    // Draw inside strip.
    drawRing(m_navCircleX, m_navCircleY,
             m_navCircleRad,
             m_navCircleRad - NAV_STRIP_WIDTH,
             white, trans);

    glMatrixMode(GL_PROJECTION);
    glPopMatrix();
    glMatrixMode(GL_MODELVIEW);
    glPopMatrix();

    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LIGHTING);
    glDisable(GL_BLEND);
}

static void drawRing(double xOfs, double yOfs,
                     double rad1, double rad2,
                     float *color1, float *color2) {
    glBegin(GL_TRIANGLE_STRIP);
    for(int i = 0; i < NAV_CIRCLE_SEGS + 1; i ++) {
        double theta = ((double) i / (double) NAV_CIRCLE_SEGS) * M_PI * 2.0;
        double x = cos(theta) * rad1 + xOfs;
        double y = sin(theta) * rad1 + yOfs;
        glColor4fv(color1);
        glVertex3d(x, y, 0.0);

        x = cos(theta) * rad2 + xOfs;
        y = sin(theta) * rad2 + yOfs;
        glColor4fv(color2);
        glVertex3d(x, y, 0.0);
    }
    glEnd();
}

void View::setSize(int w, int h) {
    m_width  = w;
    m_height = h;

    // Initialize camera.
    m_camera->setProjectSize(w, h);
    if(h == 0) {
        printf("Warning: window height zero (%s:%d)\n", __FILE__, __LINE__);
    } else {
        m_camera->setWidthToHeightRatio((double) w / (double) h);
    }

    glViewport(0, 0, w, h);
    recalcNavCircle();
}

void View::addViewListener(ViewListener *listener) {
    m_viewListeners.push_back(listener);
}

void View::addStatusListener(StatusListener *listener) {
    m_statusListeners.push_back(listener);
}

void View::setCurrent() {
    assert(0); // XXX - Implement me.
}

void View::navMouseDown(int x, int y) {
    // Detect if the pointer is inside the navigation ring.
    double deltaX = x - (m_width  / 2.0);
    double deltaY = y - (m_height / 2.0);
    double dist = sqrt(deltaX * deltaX + deltaY * deltaY);
    dist /= (m_width < m_height ? m_width : m_height);
    if(dist * 2.0 > NAV_CIRCLE_RAD) {
        m_navMode = NAV_ROTATING;
        m_navPrevX = x;
        m_navPrevY = y;
        notifyViewListeners();
        notifyStatusListeners("Drag to rotate.");
    } else {
        m_navMode  = NAV_SELECT;
        m_navPrevX = x;
        m_navPrevY = y;
        notifyViewListeners();
        notifyStatusListeners("Drag horizontal to pan, vertical to dolly.");
    }
}

void View::navMouseMove(int x, int y) {
    if(m_navMode == NAV_OFF) {
        printf("Warning: NAV_OFF encountered (%s:%d)\n", __FILE__, __LINE__);
        fflush(stdout);
        return;
    }

    if(m_navMode == NAV_SELECT) {
        // See if the user has dragged the distance needed to decide between
        // panning and zooming.
        double deltaX = m_navPrevX - x;
        double deltaY = m_navPrevY - y;
        double dist = sqrt(deltaX * deltaX + deltaY * deltaY);
        if(dist > NAV_CHOOSE_LEN) {
            double angle = atan2(-deltaY, deltaX);
            if((angle > -M_PI/2.0 - NAV_CHOOSE_ANGLE &&
                angle < -M_PI/2.0 + NAV_CHOOSE_ANGLE) ||
               (angle >  M_PI/2.0 - NAV_CHOOSE_ANGLE &&
                angle <  M_PI/2.0 + NAV_CHOOSE_ANGLE)) {
                m_navMode = NAV_ZOOMING;
                notifyStatusListeners("Drag up to dolly in, down to dolly out.");
            } else {
                m_navMode = NAV_PANNING;
                notifyStatusListeners("Drag to pan.");
            }
        } else {
            return;
        }
    }

    if(m_navMode == NAV_ZOOMING) {
        //double deltaX =  (m_navPrevX - x) / m_width;
        double deltaY = -(m_navPrevY - y) / m_height;
        m_camera->translate(IVector(0, 0, deltaY));
    } else if (m_navMode == NAV_PANNING) {
        double deltaX =  (m_navPrevX - x) / m_width;
        double deltaY = -(m_navPrevY - y) / m_height;
        m_camera->translate(IVector(deltaX, deltaY, 0.0));
    } else if (m_navMode == NAV_ROTATING) {
        // XXX - needs to be changed for non-square viewports?
        double sx1    = ( 2.0 * m_navPrevX / m_width  - 1.0) / NAV_CIRCLE_RAD;
        double sy1    = (-2.0 * m_navPrevY / m_height + 1.0) / NAV_CIRCLE_RAD;
        double sdist1 = sqrt(sx1 * sx1 + sy1 * sy1);
        double sx2    = ( 2.0 * x / m_width  - 1.0) / NAV_CIRCLE_RAD;
        double sy2    = (-2.0 * y / m_height + 1.0) / NAV_CIRCLE_RAD;
        double sdist2 = sqrt(sx2 * sx2 + sy2 * sy2);

        // Get vectors from center of trackball sphere to mouse pointer.
        IVector vec1, vec2;
        if(sdist1 < 1.0) {
            vec1 = IVector(sx1, sy1, -sqrt(1.0 - sdist1 * sdist1));
        } else {
            vec1 = IVector(sx1 / sdist1, sy1 / sdist1, 0.0);
        }
        if(sdist2 < 1.0) {
            vec2 = IVector(sx2, sy2, -sqrt(1.0 - sdist2 * sdist2));
        } else {
            vec2 = IVector(sx2 / sdist2, sy2 / sdist2, 0.0);
        }
        IVector deltaVec = vec1 - vec2;
        if(length(deltaVec) < IALGEBRA_EPSILON) return;

        // Compute rotation between the previous vector and the new one.
        IVector axis = cross(vec1, vec2);
        double angle = length(axis);
        IMatrix rotMat = rot_mat(IPoint(), axis, angle);
        m_camera->translate(IVector(0, 0, -getViewDepth()));
        m_camera->transform(rotMat);
        m_camera->translate(IVector(0, 0, getViewDepth()));
    }

    m_navPrevX = x;
    m_navPrevY = y;
    updateRotWidget();

    notifyViewListeners();
}

void View::navMouseUp(int x, int y) {
    m_navMode = NAV_OFF;
    notifyViewListeners();
    notifyStatusListeners("");
}

void View::mouseDown(int x, int y) {
    if(m_toolMode == TOOL_SELECT) {
        m_selectedJoint = getClickedJoint(x, y);
        notifyViewListeners();
    } else if(m_toolMode == TOOL_ROTATE) {
        if(m_rotWidget->mouseDown(x, y)) {
            m_rotWidgetActive = true;
        } else {
            m_rotWidgetActive = false;
            m_selectedJoint = getClickedJoint(x, y);
            updateRotWidget();
            notifyViewListeners();
        }
    }
}

void View::mouseMove(int x, int y) {
    if(m_toolMode == TOOL_SELECT) {
    } else if(m_toolMode == TOOL_ROTATE && m_rotWidgetActive) {
        m_rotWidget->mouseMove(x, y);
    }
}

void View::mouseUp(int x, int y) {
    if(m_toolMode == TOOL_SELECT) {
    } else if(m_toolMode == TOOL_ROTATE && m_rotWidgetActive) {
        m_rotWidget->mouseUp(x, y);
    }
}

int View::getToolMode() const {
    return m_toolMode;
}

void View::setToolMode(int toolMode) {
    m_toolMode = toolMode;

    if(m_toolMode == TOOL_SELECT) {
    } else if(m_toolMode == TOOL_ROTATE) {
        if(m_selectedJoint != -1) {
            updateRotWidget();
        }
    }
    redraw();
}

void View::notifyViewListeners() {
    for(int i = 0; i < (int) m_viewListeners.size(); i ++) {
        m_viewListeners[i]->notify();
    }
}

void View::notifyStatusListeners(const char *msg) {
    for(int i = 0; i < (int) m_statusListeners.size(); i ++) {
        m_statusListeners[i]->notify(msg);
    }
}

void View::recalcNavCircle() {
    m_navCircleRad = NAV_CIRCLE_RAD;
    m_navCircleX   = 0.0;
    m_navCircleY   = 0.0;
}

double View::getViewDepth() const {
    return 1.6;
}

void View::redraw() {
    notifyViewListeners();
}

void View::rotWidgetChanged(RotWidget *widget, const IPoint &quat) {
    assert(widget == m_rotWidget);
}

int View::getClickedJoint(int x, int y) {
    // Generate the screen locations of the joints.
    IMatrix projMat = m_camera->getProjectMat() * m_modelTransform;

    int numJoints = m_model->getNumJoints();
    std::vector<IPoint> jointLocs;
    std::vector<int> jointIndexes;
    for(int i = 0; i < numJoints; i ++) {
        const JointInfo &ji = m_model->getJointInfo(i);
        IPoint loc = projMat * ji.m_localToGlobalMat * IPoint();
        if(fabs(loc[3]) < IALGEBRA_EPSILON) {
            printf("Warning: bad projection encountered (%s:%d)\n", __FILE__, __LINE__);
            continue;
        } else {
            loc.homogenize();
        }
        if(loc[0] < 0 || loc[0] > m_width ||
           loc[1] < 0 || loc[1] > m_height ||
           loc[2] < 0 || loc[2] > 1.0) {
            continue;
        }
        jointLocs.push_back(loc);
        jointIndexes.push_back(i);
    }

    // Find the joint closest to the clicked location.
    int closestJoint = -1;
    IPoint closestPoint;
    int jfd2 = JOINT_FUDGE_DIST * JOINT_FUDGE_DIST;
    for(int i = 0; i < (int) jointLocs.size(); i ++) {
        const IPoint &pt = jointLocs[i];
        int pti = jointIndexes[i];
        int deltaX = x - (int) pt[0];
        int deltaY = y - (int) pt[1];
        int d2 = deltaX * deltaX + deltaY * deltaY;
        if(d2 < jfd2) {
            if(closestJoint == -1 ||
               pt[2] < closestPoint[2]) {
                closestJoint = pti;
                closestPoint = pt;
            }
        }
    }
    return closestJoint;
}

void View::updateRotWidget() {
    if(m_selectedJoint != -1) {
        const JointInfo &ji = m_model->getJointInfo(m_selectedJoint);
        IPoint loc = m_modelTransform * ji.m_localToGlobalMat * IPoint();
        m_rotWidget->setLocation(loc);
        // XXX - set initial rotation here.
        m_rotWidget->setRotation(ji.m_parentQuat);
    }
}

