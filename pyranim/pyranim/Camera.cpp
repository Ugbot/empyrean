#include "Camera.h"
#include <math.h>
  
Camera::Camera() : 
    m_eye(0.0, 0.0, 0.0),
    m_look(0.0, 0.0, -1.0),
    m_up(0.0, 1.0, 0.0),
    m_heightAngle(60.0),
    m_clipNear(1.0),
    m_clipFar(10.0),
    m_obliqueAngleHorz(0.0),
    m_obliqueAngleVert(0.0),
    m_whRatio(1.0),
    m_width(1.0),
    m_height(1.0)
{
    m_projection = PROJECT_PERSPECTIVE;
    refreshScaleXYMatrix();
    refreshScaleXYZMatrix();
    refreshPerspectiveMatrix();
    refreshWorldToCameraMatrix();
}

Camera::~Camera() {
}

void Camera::refreshDeskewMatrix() {
    double tanHorz = tan(m_obliqueAngleHorz);
    double tanVert = tan(m_obliqueAngleVert);

    m_deskewMat = IMatrix(1,0,-tanHorz,0,
			   0,1,-tanVert,0,
			   0,0,1,0,
			   0,0,0,1);
}

void Camera::refreshScaleXYMatrix() {
    double cotAngle = 1.0 / tan(m_heightAngle / 2.0);

    m_scaleXYMat = scale_mat(cotAngle, m_whRatio * cotAngle, 1.0);
}

void Camera::refreshScaleXYZMatrix() {
    double farInverse = 1.0 / m_clipFar;

    m_scaleXYZMat = scale_mat(farInverse, farInverse, farInverse);
}

void Camera::refreshPerspectiveMatrix() {
    double k = m_clipNear / m_clipFar;

    m_perspectiveMat = IMatrix(1, 0,                0,             0,
			       0, 1,                0,             0,
			       0, 0,  1.0 / (k - 1.0), k / (k - 1.0),
			       0, 0,             -1.0,             0);
}

void Camera::refreshWorldToCameraMatrix() {
    IMatrix &wc = m_worldToCameraMat;
    if(m_projection == PROJECT_PERSPECTIVE) {
	wc = (m_perspectiveMat * m_scaleXYZMat * m_scaleXYMat *
              m_deskewMat * m_rotateMat * m_translateMat);
    } else {
	double k = m_clipNear / m_clipFar;
	wc = IMatrix(1,0,0,0,
                     0,1,0,0,
                     0,0,1.0/(k - 1.0),-k/(k - 1.0),
                     0,0,0,1);
	wc = wc * (m_scaleXYZMat * m_scaleXYMat *
                   m_deskewMat * m_rotateMat * m_translateMat);
    }

    m_projectMat = IMatrix(m_width/2,          0,   0,  m_width/2,
                                   0,-m_height/2,   0, m_height/2, 
                                   0,          0, 0.5,        0.5,
                                   0,          0,   0,          1) * wc;
    m_unprojectMat = invert(m_projectMat);
}

const IPoint  &Camera::getEye() const {
    return m_eye;
}

const IVector &Camera::getLook() const {
    return m_look;
}

const IVector &Camera::getUp() const {
    return m_up;
}

double Camera::getHeightAngle() const {
    return m_heightAngle;
}

const IMatrix &Camera::getWorldToFilm() const {
    return m_worldToCameraMat;
}

const IMatrix &Camera::getFilmToWorld() const {
    return m_cameraToWorldMat;
}

void Camera::orient(const IPoint& ep,
		    const IVector& lv,
		    const IVector& uv) {
    m_eye = ep;
    m_look = normalize(lv);
    m_up = uv;

    m_translateMat = inv_trans_mat(IVector(ep[0], ep[1], ep[2]));
    
    IVector n = - normalize(lv);
    IVector v = normalize(uv - dot(uv, n) * n);
    IVector u = normalize(cross(v, n));
    
    m_rotateMat = IMatrix(u[0], u[1], u[2], 0.0,
			  v[0], v[1], v[2], 0.0,
			  n[0], n[1], n[2], 0.0,
			  0.0, 0.0, 0.0, 1.0);
    refreshWorldToCameraMatrix();
}

void Camera::orient(const IPoint& e,
		    const IPoint& focus,
		    const IVector& u) {
    orient(e, focus - e, u);
}
  
void Camera::setHeightAngle(const int degrees) {
     m_heightAngle = (double) degrees * M_PI / 180.0;
     refreshScaleXYMatrix();
     refreshWorldToCameraMatrix();
}

void Camera::setWidthToHeightRatio(double ratio) {
    // Ratio should not be zero.
    assert(fabs(ratio) > IALGEBRA_EPSILON);

    m_whRatio = ratio;
    refreshScaleXYMatrix();
    refreshWorldToCameraMatrix();
}

void Camera::translate(const IVector &v) {
    m_eye = m_eye + transpose(m_rotateMat) * v;
    orient(m_eye, m_look, m_up);
}

void Camera::rotateX(const double degrees) {
    double radians = (degrees * M_PI) / 180.0;
    IMatrix m = transpose(m_rotateMat) * rotX_mat(radians) * m_rotateMat;
    m_look = m * m_look;
    m_up = m * m_up;
    orient(m_eye, m_look, m_up);
}

void Camera::rotateY(const double degrees) {
    double radians = (degrees * M_PI) / 180.0;
    IMatrix m = transpose(m_rotateMat) * rotY_mat(radians) * m_rotateMat;
    m_look = m * m_look;
    m_up = m * m_up;
    orient(m_eye, m_look, m_up);
}

void Camera::rotateZ(const double degrees) {
    double radians = (degrees * M_PI) / 180.0;
    IMatrix m = transpose(m_rotateMat) * rotZ_mat(radians) * m_rotateMat;
    m_look = m * m_look;
    m_up = m * m_up;
    orient(m_eye, m_look, m_up);
}

void Camera::transform(const IMatrix &mat, bool keepUp) {
    IMatrix m = transpose(m_rotateMat) * mat * m_rotateMat;
    m_eye = m * m_eye;
    m_look = m * m_look;
    if(!keepUp) {
        m_up = m * m_up;
    }
    orient(m_eye, m_look, m_up);
}

void Camera::setClip(const double near, const double far) {
    // Near plane should not be at zero.
    assert(fabs(near) >= IALGEBRA_EPSILON);
    // Far plane should not be at zero.
    assert(fabs(far ) >= IALGEBRA_EPSILON);

    m_clipNear = near;
    m_clipFar = far;
    refreshScaleXYZMatrix();
    refreshPerspectiveMatrix();
    refreshWorldToCameraMatrix();
}

void Camera::setObliqueAngleVert(const double angle) {
    m_obliqueAngleVert = (angle * M_PI) / 180.0;
    refreshDeskewMatrix();
    refreshWorldToCameraMatrix();
}

void Camera::setObliqueAngleHorz(const double angle) {
    m_obliqueAngleHorz = (angle * M_PI) / 180.0;
    refreshDeskewMatrix();
    refreshWorldToCameraMatrix();
}

void Camera::setProjection(int p) {
    m_projection = p;
    refreshWorldToCameraMatrix();
}

const IMatrix &Camera::getProjectMat() const {
    return m_projectMat;
}

const IMatrix &Camera::getUnprojectMat() const {
    return m_unprojectMat;
}

void Camera::setProjectSize(double width, double height) {
    m_width = width;
    m_height = height;
}

double Camera::getProjectWidth() const {
    return m_width;
}

double Camera::getProjectHeight() const {
    return m_height;
}


