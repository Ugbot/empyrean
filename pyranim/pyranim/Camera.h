#ifndef INCLUDED_CAMERA_H
#define INCLUDED_CAMERA_H

#include "IAlgebra.h"

class Camera {
public:
    enum { PROJECT_PERSPECTIVE = 0,
	   PROJECT_ORTHOGRAPHIC = 1};
  
    Camera();
    virtual ~Camera();

    virtual const IPoint  &getEye() const;
    virtual const IVector &getLook() const;
    virtual const IVector &getUp() const;
    virtual double getHeightAngle() const;
    virtual const IMatrix &getWorldToFilm() const;
    virtual const IMatrix &getFilmToWorld() const;

    virtual void orient(const IPoint& eye,
			const IVector& look,
			const IVector& up);
    virtual void orient(const IPoint& eye,
			const IPoint& focus,
			const IVector& up);
  
    virtual void setHeightAngle(const int degrees);
    virtual void setWidthToHeightRatio(double ratio);
    virtual void translate(const IVector &v);
    virtual void rotateX(const double degrees);
    virtual void rotateY(const double degrees);
    virtual void rotateZ(const double degrees);
    virtual void transform(const IMatrix &m, bool keepUp = true);
    virtual void setClip(const double near, const double far);
    virtual void setObliqueAngleVert(const double angle);
    virtual void setObliqueAngleHorz(const double angle);
    virtual void setProjection(int p);

    virtual const IMatrix &getProjectMat() const;
    virtual const IMatrix &getUnprojectMat() const;

    virtual void setProjectSize(double width, double height);
    virtual double getProjectWidth() const;
    virtual double getProjectHeight() const;

protected:
    IPoint m_eye;
    IVector m_look;
    IVector m_up;
    double m_heightAngle;
    double m_clipNear;
    double m_clipFar;
    double m_obliqueAngleHorz;
    double m_obliqueAngleVert;
    double m_whRatio;
    double m_width;
    double m_height;
    int m_projection;

    IMatrix m_worldToCameraMat;
    IMatrix m_cameraToWorldMat;
    IMatrix m_projectMat;
    IMatrix m_unprojectMat;
    IMatrix m_translateMat;
    IMatrix m_rotateMat;
    IMatrix m_deskewMat;
    IMatrix m_scaleXYMat;
    IMatrix m_scaleXYZMat;
    IMatrix m_perspectiveMat;

    void refreshDeskewMatrix();
    void refreshScaleXYMatrix();
    void refreshScaleXYZMatrix();
    void refreshPerspectiveMatrix();
    void refreshWorldToCameraMatrix();

private:
    // Not defined:
    Camera(const Camera &);
    Camera &operator=(const Camera &);
};

#endif
