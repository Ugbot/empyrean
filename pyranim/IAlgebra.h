/****************************************************************/
/*    FILE: IAlgebra.H                                          */
/*    INFO:                                                     */
/*       For your matricies, make sure you use column-major     */
/*       form when storing values.  However, to maintain        */
/*       consistency with standard matrix notation,             */
/*       element (3,2) of the following matrix would be 'o'     */
/*                                                              */
/*                 [a b c d]                                    */
/*                 [e f g h]                                    */
/*                 [i j k l]                                    */
/*                 [m n o p]                                    */
/*                                                              */
/*       To reiterate, this matrix would have the following     */
/*       representation when stored in memory:                  */
/*            a e i m b f j k n c g k o d h l p                 */
/*                                                              */
/****************************************************************/

#ifndef INCLUDED_IALGEBRA_H
#define INCLUDED_IALGEBRA_H

#include <GL/gl.h>
#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <math.h>

#ifndef M_PI
#define M_PI   3.1415926535898 
#endif

const GLdouble IALGEBRA_EPSILON = (1.0e-08);

class IPoint {
private:
    GLdouble m_x[4];
  
public:
    inline IPoint() {
	m_x[0] = m_x[1] = m_x[2] = 0.0;
	m_x[3] = 1.0;
    }

    inline IPoint(const GLdouble x, const GLdouble y, const GLdouble z) {
	m_x[0] = x;
	m_x[1] = y;
	m_x[2] = z;
	m_x[3] = 1.0;
    }

    inline IPoint(const GLdouble x, const GLdouble y, const GLdouble z, const GLdouble w) {
	m_x[0] = x;
	m_x[1] = y;
	m_x[2] = z;
	m_x[3] = w;
    }

    inline IPoint(const GLdouble *p) {
	memcpy(m_x, p, 4 * sizeof(GLdouble));
    }

    inline IPoint(const IPoint& p) {
	memcpy(m_x, p.m_x, 4 * sizeof(GLdouble));
    }

    //inline ~IPoint() {}

    inline void unpack(GLdouble *p) const {
	memcpy(p, m_x, 4 * sizeof(GLdouble));
    }

    inline const GLdouble *getData() const {
	return m_x;
    }
  
    inline int operator==(const IPoint& p) const {
	GLdouble deltaX = m_x[0] - p.m_x[0];
	GLdouble deltaY = m_x[1] - p.m_x[1];
	GLdouble deltaZ = m_x[2] - p.m_x[2];
	GLdouble deltaW = m_x[3] - p.m_x[3];
	GLdouble error = (deltaX * deltaX + 
			  deltaY * deltaY + 
			  deltaZ * deltaZ +
			  deltaW * deltaW);
	return (error < IALGEBRA_EPSILON);
    }

    inline int operator!=(const IPoint& p) const {
	GLdouble deltaX = m_x[0] - p.m_x[0];
	GLdouble deltaY = m_x[1] - p.m_x[1];
	GLdouble deltaZ = m_x[2] - p.m_x[2];
	GLdouble deltaW = m_x[3] - p.m_x[3];
	GLdouble error = (deltaX * deltaX + 
			  deltaY * deltaY + 
			  deltaZ * deltaZ +
			  deltaW * deltaW);
	return (error >= IALGEBRA_EPSILON);	
    }

    inline int operator<(const IPoint &p2) const {
	if(m_x[0] < p2.m_x[0]) return 1;
	if(m_x[0] > p2.m_x[0]) return 0;

	if(m_x[1] < p2.m_x[1]) return 1;
	if(m_x[1] > p2.m_x[1]) return 0;

	if(m_x[2] < p2.m_x[2]) return 1;
	return 0;
    }

    inline IPoint& operator=(const IPoint& p) {
	memcpy(m_x, p.m_x, 4 * sizeof(GLdouble));
	return *this;
    }
 
    inline GLdouble operator[](const int i) const {
	return m_x[i];
    }

    inline GLdouble& operator[](const int i) {
	return m_x[i];
    }

    inline void homogenize() {
	assert(fabs(m_x[3]) >= IALGEBRA_EPSILON);
	m_x[0] /= m_x[3];
	m_x[1] /= m_x[3];
	m_x[2] /= m_x[3];
	m_x[3] = 1.0;
    }

    inline void print() const {
	printf("(%g,%g,%g,%g)\n", m_x[0], m_x[1], m_x[2], m_x[3]);
    }
};


class IVector {
private:
    GLdouble m_x[4];

public:
    inline IVector() {
	m_x[0] = m_x[1] = m_x[2] = m_x[3] = 0.0;
    }

    inline IVector(const GLdouble x, const GLdouble y, const GLdouble z) {
	m_x[0] = x;
	m_x[1] = y;
	m_x[2] = z;
	m_x[3] = 0.0;
    }

    inline IVector(const GLdouble *v) {
	memcpy(m_x, v, 4 * sizeof(GLdouble));	
    }

    inline IVector(const IVector& v) {
	memcpy(m_x, v.m_x, 4 * sizeof(GLdouble));
    }

    //inline ~IVector() {}

    inline void unpack(GLdouble *v) const {
	memcpy(v, m_x, 4 * sizeof(GLdouble));
    }

    inline const GLdouble *getData() const {
	return m_x;
    }
  
    inline int operator==(const IVector& v) const {
	GLdouble deltaX = m_x[0] - v.m_x[0];
	GLdouble deltaY = m_x[1] - v.m_x[1];
	GLdouble deltaZ = m_x[2] - v.m_x[2];
	GLdouble deltaW = m_x[3] - v.m_x[3];
	GLdouble error = (deltaX * deltaX + 
			  deltaY * deltaY + 
			  deltaZ * deltaZ +
			  deltaW * deltaW);
	return (error < IALGEBRA_EPSILON);
    }

    inline int operator!=(const IVector& v) const {
	GLdouble deltaX = m_x[0] - v.m_x[0];
	GLdouble deltaY = m_x[1] - v.m_x[1];
	GLdouble deltaZ = m_x[2] - v.m_x[2];
	GLdouble deltaW = m_x[3] - v.m_x[3];
	GLdouble error = (deltaX * deltaX + 
			  deltaY * deltaY + 
			  deltaZ * deltaZ +
			  deltaW * deltaW);
	return (error >= IALGEBRA_EPSILON);
    }

    inline IVector & operator=(const IVector& v) {
	memcpy(m_x, v.m_x, 4 * sizeof(GLdouble));
	return *this;
    }

    inline GLdouble operator[](const int i) const {
	return m_x[i];
    }

    inline GLdouble& IVector::operator[](const int i) {
	return m_x[i];
    }

    inline void normalize() {
	GLdouble den = sqrt(m_x[0] * m_x[0]+
			    m_x[1] * m_x[1]+
			    m_x[2] * m_x[2]);
	assert(fabs(den) >= IALGEBRA_EPSILON);
	m_x[0] /= den;
	m_x[1] /= den;
	m_x[2] /= den;
    }

    inline void print() const {
	printf("<%g,%g,%g,%g>\n", m_x[0], m_x[1], m_x[2], m_x[3]);
    }
};


class IMatrix {

private:
    GLdouble m_x[16];

    static GLdouble identityMatrix[16];

public:

    enum {
	TYPE_SCALE = 0,
	TYPE_TRANSLATE,
	TYPE_ROTATE_X,
	TYPE_ROTATE_Y,
	TYPE_ROTATE_Z
    };

    inline IMatrix() {
	memcpy(m_x, identityMatrix, 16 * sizeof(GLdouble));
    }

    inline IMatrix(const int type, const GLdouble p1, const GLdouble p2, const GLdouble p3) {
	memcpy(m_x, identityMatrix, 16 * sizeof(GLdouble));
	switch(type) {
	case TYPE_SCALE:
	    m_x[ 0] = p1;
	    m_x[ 5] = p2;
	    m_x[10] = p3;
	    break;
	case TYPE_TRANSLATE:
	    m_x[12] = p1;
	    m_x[13] = p2;
	    m_x[14] = p3;
	    break;
	}
    }

    inline IMatrix(const int type, const GLdouble angle) {
	memcpy(m_x, identityMatrix, 16 * sizeof(GLdouble));
	GLdouble s = sin(angle);
	GLdouble c = cos(angle);
	switch(type) {
	case TYPE_ROTATE_X:
	    m_x[ 5] =  c;
	    m_x[ 9] = -s;
	    m_x[ 6] =  s;
	    m_x[10] =  c;
	    break;
	case TYPE_ROTATE_Y:
	    m_x[ 0] =  c;
	    m_x[ 8] =  s;
	    m_x[ 2] = -s;
	    m_x[10] =  c;
	    break;
	case TYPE_ROTATE_Z:
	    m_x[ 0] =  c;
	    m_x[ 4] = -s;
	    m_x[ 1] =  s;
	    m_x[ 5] =  c;
	    break;
	}	
    }

    inline IMatrix
    (const GLdouble a, const GLdouble b, const GLdouble c, const GLdouble d,
     const GLdouble e, const GLdouble f, const GLdouble g, const GLdouble h,
     const GLdouble i, const GLdouble j, const GLdouble k, const GLdouble l,
     const GLdouble m, const GLdouble n, const GLdouble o, const GLdouble p) {
	m_x[0]=a; m_x[4]=b; m_x[ 8]=c; m_x[12]=d;
	m_x[1]=e; m_x[5]=f; m_x[ 9]=g; m_x[13]=h;
	m_x[2]=i; m_x[6]=j; m_x[10]=k; m_x[14]=l;
	m_x[3]=m; m_x[7]=n; m_x[11]=o; m_x[15]=p;
    }

    inline IMatrix(const GLdouble *m) {
	memcpy(m_x, m, 16 * sizeof(GLdouble));	
    }

    inline IMatrix(const IMatrix& m) {
	memcpy(m_x, m.m_x, 16 * sizeof(GLdouble));
    }

    //inline ~IMatrix() {}

    inline void unpack(GLdouble *m) const {
	memcpy(m, m_x, 16 * sizeof(GLdouble));
    }

    inline const GLdouble *getData() const {
	return m_x;
    }
  
    inline int operator==(const IMatrix& m) const {
	GLdouble error, delta;
	delta = m_x[ 0] - m.m_x[ 0]; error = delta * delta;
	delta = m_x[ 1] - m.m_x[ 1]; error += delta * delta;
	delta = m_x[ 2] - m.m_x[ 2]; error += delta * delta;
	delta = m_x[ 3] - m.m_x[ 3]; error += delta * delta;
	delta = m_x[ 4] - m.m_x[ 4]; error += delta * delta;
	delta = m_x[ 5] - m.m_x[ 5]; error += delta * delta;
	delta = m_x[ 6] - m.m_x[ 6]; error += delta * delta;
	delta = m_x[ 7] - m.m_x[ 7]; error += delta * delta;
	delta = m_x[ 8] - m.m_x[ 8]; error += delta * delta;
	delta = m_x[ 9] - m.m_x[ 9]; error += delta * delta;
	delta = m_x[10] - m.m_x[10]; error += delta * delta;
	delta = m_x[11] - m.m_x[11]; error += delta * delta;
	delta = m_x[12] - m.m_x[12]; error += delta * delta;
	delta = m_x[13] - m.m_x[13]; error += delta * delta;
	delta = m_x[14] - m.m_x[14]; error += delta * delta;
	delta = m_x[15] - m.m_x[15]; error += delta * delta;
	return (error < IALGEBRA_EPSILON);
    }

    inline int operator!=(const IMatrix& m) const {
	GLdouble error, delta;
	delta = m_x[ 0] - m.m_x[ 0]; error = delta * delta;
	delta = m_x[ 1] - m.m_x[ 1]; error += delta * delta;
	delta = m_x[ 2] - m.m_x[ 2]; error += delta * delta;
	delta = m_x[ 3] - m.m_x[ 3]; error += delta * delta;
	delta = m_x[ 4] - m.m_x[ 4]; error += delta * delta;
	delta = m_x[ 5] - m.m_x[ 5]; error += delta * delta;
	delta = m_x[ 6] - m.m_x[ 6]; error += delta * delta;
	delta = m_x[ 7] - m.m_x[ 7]; error += delta * delta;
	delta = m_x[ 8] - m.m_x[ 8]; error += delta * delta;
	delta = m_x[ 9] - m.m_x[ 9]; error += delta * delta;
	delta = m_x[10] - m.m_x[10]; error += delta * delta;
	delta = m_x[11] - m.m_x[11]; error += delta * delta;
	delta = m_x[12] - m.m_x[12]; error += delta * delta;
	delta = m_x[13] - m.m_x[13]; error += delta * delta;
	delta = m_x[14] - m.m_x[14]; error += delta * delta;
	delta = m_x[15] - m.m_x[15]; error += delta * delta;
	return (error >= IALGEBRA_EPSILON);
    }

    inline IMatrix& operator=(const IMatrix& m) {
	memcpy(m_x, m.m_x, 16 * sizeof(GLdouble));
	return *this;
    }
  
    inline GLdouble operator()(const int i, const int j) const {
	return m_x[j * 4 + i];	
    }

    inline GLdouble& operator()(const int i, const int j) {
	return m_x[j * 4 + i];	
    }

    inline void print() const {
	printf("[%g,%g,%g,%g]\n", m_x[0], m_x[4], m_x[8 ], m_x[12]);
	printf("[%g,%g,%g,%g]\n", m_x[1], m_x[5], m_x[9 ], m_x[13]);
	printf("[%g,%g,%g,%g]\n", m_x[2], m_x[6], m_x[10], m_x[14]);
	printf("[%g,%g,%g,%g]\n", m_x[3], m_x[7], m_x[11], m_x[15]);
    }
};

// This adds a vector to a point, and returns the resultant point
inline IPoint operator+(const IVector& v, const IPoint& p) {
  return IPoint(p[0] + v[0],
		p[1] + v[1],
		p[2] + v[2],
		p[3]);    
}

// This does the same.
inline IPoint operator+(const IPoint& p, const IVector& v) {
  return IPoint(p[0] + v[0],
		p[1] + v[1],
		p[2] + v[2],
		p[3]);
}

// This adds two vectors, and returns the resultant one
inline IVector operator+(const IVector& v1, const IVector& v2) {
  return IVector(v1[0] + v2[0],
		 v1[1] + v2[1],
		 v1[2] + v2[2]);
}

// Note: no (point + point) operator

// This subtracts a vector from a point, and returns the resultant point.
inline IPoint operator-(const IPoint& p, const IVector& v) {
  return IPoint(p[0] - v[0],
		p[1] - v[1],
		p[2] - v[2]);
}

// This returns the negated vector
inline IVector operator-(const IVector& v) {
    return IVector(-v[0],-v[1],-v[2]);
}

// This subtracts the second vector from the first, and returns the resultant.
inline IVector operator-(const IVector& v1, const IVector& v2) {
  return IVector(v1[0] - v2[0],
		 v1[1] - v2[1],
		 v1[2] - v2[2]);
}

// This returns the vector spanning point 1 and point 2
inline IVector operator-(const IPoint& p1, const IPoint& p2) {
    return IVector(p1[0] - p2[0],
		   p1[1] - p2[1],
		   p1[2] - p2[2]);
}

// Note: no (vector - point) or (- point) operators

// --- Scalars

// This divides a vector by a scalar
inline IVector operator/(const IVector& v, const GLdouble s) {
    assert(fabs(s) >= IALGEBRA_EPSILON);
    return IVector(v[0] / s,
		   v[1] / s,
		   v[2] / s);
}

// This should multiply the vector by the scalar, returning a vector
inline IVector operator*(const GLdouble s, const IVector& v) {
    return IVector(s * v[0],
		   s * v[1],
		   s * v[2]);
}

// This does the same.
inline IVector operator*(const IVector& v, const GLdouble s) {
    return IVector(s * v[0],
		   s * v[1],
		   s * v[2]);
}


// --- Matrix Operator

// Applies the matrix to a point, returns the new point
inline IPoint operator*(const IMatrix& m, const IPoint& p) {
    GLdouble x = p[0]*m(0,0) + p[1]*m(0,1) + p[2]*m(0,2) + p[3]*m(0,3);
    GLdouble y = p[0]*m(1,0) + p[1]*m(1,1) + p[2]*m(1,2) + p[3]*m(1,3);
    GLdouble z = p[0]*m(2,0) + p[1]*m(2,1) + p[2]*m(2,2) + p[3]*m(2,3);
    GLdouble w = p[0]*m(3,0) + p[1]*m(3,1) + p[2]*m(3,2) + p[3]*m(3,3);
    return IPoint(x, y, z, w);
}

// Applies the matrix to the vector, returns the new vector.
inline IVector operator*(const IMatrix& m, const IVector& v) {
    GLdouble x = v[0]*m(0,0) + v[1]*m(0,1) + v[2]*m(0,2) + v[3]*m(0,3);
    GLdouble y = v[0]*m(1,0) + v[1]*m(1,1) + v[2]*m(1,2) + v[3]*m(1,3);
    GLdouble z = v[0]*m(2,0) + v[1]*m(2,1) + v[2]*m(2,2) + v[3]*m(2,3);
    return IVector(x, y, z);
}

// Multiplies two matrices together, returns the resultant matrix
inline IMatrix operator*(const IMatrix& m1, const IMatrix& m2) {
    GLdouble a = m1(0,0)*m2(0,0) + m1(0,1)*m2(1,0) + m1(0,2)*m2(2,0) + m1(0,3)*m2(3,0);
    GLdouble b = m1(0,0)*m2(0,1) + m1(0,1)*m2(1,1) + m1(0,2)*m2(2,1) + m1(0,3)*m2(3,1);
    GLdouble c = m1(0,0)*m2(0,2) + m1(0,1)*m2(1,2) + m1(0,2)*m2(2,2) + m1(0,3)*m2(3,2);
    GLdouble d = m1(0,0)*m2(0,3) + m1(0,1)*m2(1,3) + m1(0,2)*m2(2,3) + m1(0,3)*m2(3,3);

    GLdouble e = m1(1,0)*m2(0,0) + m1(1,1)*m2(1,0) + m1(1,2)*m2(2,0) + m1(1,3)*m2(3,0);
    GLdouble f = m1(1,0)*m2(0,1) + m1(1,1)*m2(1,1) + m1(1,2)*m2(2,1) + m1(1,3)*m2(3,1);
    GLdouble g = m1(1,0)*m2(0,2) + m1(1,1)*m2(1,2) + m1(1,2)*m2(2,2) + m1(1,3)*m2(3,2);
    GLdouble h = m1(1,0)*m2(0,3) + m1(1,1)*m2(1,3) + m1(1,2)*m2(2,3) + m1(1,3)*m2(3,3);

    GLdouble i = m1(2,0)*m2(0,0) + m1(2,1)*m2(1,0) + m1(2,2)*m2(2,0) + m1(2,3)*m2(3,0);
    GLdouble j = m1(2,0)*m2(0,1) + m1(2,1)*m2(1,1) + m1(2,2)*m2(2,1) + m1(2,3)*m2(3,1);
    GLdouble k = m1(2,0)*m2(0,2) + m1(2,1)*m2(1,2) + m1(2,2)*m2(2,2) + m1(2,3)*m2(3,2);
    GLdouble l = m1(2,0)*m2(0,3) + m1(2,1)*m2(1,3) + m1(2,2)*m2(2,3) + m1(2,3)*m2(3,3);

    GLdouble m = m1(3,0)*m2(0,0) + m1(3,1)*m2(1,0) + m1(3,2)*m2(2,0) + m1(3,3)*m2(3,0);
    GLdouble n = m1(3,0)*m2(0,1) + m1(3,1)*m2(1,1) + m1(3,2)*m2(2,1) + m1(3,3)*m2(3,1);
    GLdouble o = m1(3,0)*m2(0,2) + m1(3,1)*m2(1,2) + m1(3,2)*m2(2,2) + m1(3,3)*m2(3,2);
    GLdouble p = m1(3,0)*m2(0,3) + m1(3,1)*m2(1,3) + m1(3,2)*m2(2,3) + m1(3,3)*m2(3,3);

    return IMatrix(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p);
}


// --- Vector dot and cross products

// Returns the dot product of the two vectors.
inline GLdouble dot(const IVector& u, const IVector& v) {
  return (u[0] * v[0] +
	  u[1] * v[1] +
	  u[2] * v[2]);
}

// Returns the cross product of the two vectors.
inline IVector cross(const IVector& u, const IVector& v) {
    return IVector(u[1] * v[2] - u[2] * v[1],
		   u[2] * v[0] - u[0] * v[2],
		   u[0] * v[1] - u[1] * v[0]);
}


// returns the length of the vector
inline GLdouble length(const IVector& v) {
    return sqrt(v[0] * v[0] +
		v[1] * v[1] +
		v[2] * v[2]);
}

// Returns the normalized vector
inline IVector normalize(const IVector& v) {
  GLdouble length = sqrt(v[0] * v[0] +
			 v[1] * v[1] +
			 v[2] * v[2]);
  assert(fabs(length) >= IALGEBRA_EPSILON);
  return IVector(v[0] / length,
		 v[1] / length,
		 v[2] / length);
}

// Transforms --------------------------------------------------------

inline IMatrix transpose(const IMatrix& m) {
    return IMatrix(m(0,0),m(1,0),m(2,0),m(3,0),
		   m(0,1),m(1,1),m(2,1),m(3,1),
		   m(0,2),m(1,2),m(2,2),m(3,2),
		   m(0,3),m(1,3),m(2,3),m(3,3));
}

inline IMatrix scale_mat(const IVector& v) {
    return IMatrix(IMatrix::TYPE_SCALE, v[0], v[1], v[2]);
}

inline IMatrix scale_mat(const GLdouble x, const GLdouble y, const GLdouble z) {
    return IMatrix(IMatrix::TYPE_SCALE, x, y, z);
}

inline IMatrix trans_mat(const IVector& v) {
    return IMatrix(IMatrix::TYPE_TRANSLATE, v[0], v[1], v[2]);
}

inline IMatrix rotX_mat(const GLdouble radians) {
    return IMatrix(IMatrix::TYPE_ROTATE_X, radians);
}

inline IMatrix rotY_mat(const GLdouble radians) {
    return IMatrix(IMatrix::TYPE_ROTATE_Y, radians);
}

inline IMatrix rotZ_mat(const GLdouble radians) {
    return IMatrix(IMatrix::TYPE_ROTATE_Z, radians);
}

inline IMatrix quat_to_mat(const IPoint &p) {
    // Quaternion to matrix routine from Watt and Watt, p.363

    GLdouble qx = p[0];
    GLdouble qy = p[1];
    GLdouble qz = p[2];
    GLdouble qw = p[3];

    GLdouble xs = qx * 2.0;
    GLdouble ys = qy * 2.0;
    GLdouble zs = qz * 2.0;

    GLdouble wx = qw * xs;
    GLdouble wy = qw * ys;
    GLdouble wz = qw * zs;
    GLdouble xx = qx * xs;
    GLdouble xy = qx * ys;
    GLdouble xz = qx * zs;
    GLdouble yy = qy * ys;
    GLdouble yz = qy * zs;
    GLdouble zz = qz * zs;

    GLdouble a = 1.0 - (yy + zz);
    GLdouble b = xy + wz;
    GLdouble c = xz - wy;

    GLdouble d = xy - wz;
    GLdouble e = 1.0 - (xx + zz);
    GLdouble f = yz + wx;

    GLdouble g = xz + wy;
    GLdouble h = yz - wx;
    GLdouble i = 1.0 - (xx + yy);

    IMatrix quatRot(a, b, c, 0.0,
                    d, e, f, 0.0,
                    g, h, i, 0.0,
                    0.0, 0.0, 0.0, 1.0);
    return quatRot;
}

inline IMatrix rot_mat(const IPoint& p, const IVector& v, const GLdouble angle) {
    GLdouble halfAngle = -angle / 2.0;
    GLdouble cosAngle  = cos(halfAngle);
    GLdouble sinAngle  = sin(halfAngle);

    GLdouble l = length(v); 

    // Set up quaternion

    assert(fabs(l) >= IALGEBRA_EPSILON);
    IPoint q;
    q[0] = sinAngle * v[0] / l;
    q[1] = sinAngle * v[1] / l;
    q[2] = sinAngle * v[2] / l;
    q[3] = cosAngle;

    IMatrix quatRot = quat_to_mat(q);

    // Multiply in translation matrices
    IMatrix transMat(IMatrix::TYPE_TRANSLATE, p[0], p[1], p[2]);
    IMatrix invTransMat(IMatrix::TYPE_TRANSLATE, -p[0], -p[1], -p[2]);
    return (transMat * quatRot * invTransMat);
}

inline IMatrix inv_scale_mat(const IVector& v) {
    assert(fabs(v[0]) >= IALGEBRA_EPSILON);
    assert(fabs(v[1]) >= IALGEBRA_EPSILON);
    assert(fabs(v[2]) >= IALGEBRA_EPSILON);
    return IMatrix(IMatrix::TYPE_SCALE, 
		   1.0 / v[0], 
		   1.0 / v[1], 
		   1.0 / v[2]);
}

inline IMatrix inv_trans_mat(const IVector& v) {
    return IMatrix(IMatrix::TYPE_TRANSLATE, -v[0], -v[1], -v[2]);
}

inline IMatrix inv_rotX_mat(const GLdouble radians) {
    return IMatrix(IMatrix::TYPE_ROTATE_X, -radians);
}

inline IMatrix inv_rotY_mat(const GLdouble radians) {
    return IMatrix(IMatrix::TYPE_ROTATE_Y, -radians);
}

inline IMatrix inv_rotZ_mat(const GLdouble radians) {
    return IMatrix(IMatrix::TYPE_ROTATE_Z, -radians);
}

inline IMatrix inv_rot_mat(const IPoint& p, const IVector& v, const GLdouble radians) {
    return rot_mat(p, v, -radians);
}

IMatrix gaussJordanInvert(const IMatrix& matrix);

inline IMatrix invert(const IMatrix& m) {
    if(m(3,0) != 0.0 ||
       m(3,1) != 0.0 ||
       m(3,2) != 0.0 ||
       m(3,3) != 1.0) {
        return gaussJordanInvert(m);
    }

    // Less work to calculate the matrix directly when it is 
    // in 3x3 homogenous form.

    GLdouble a = m(0, 0);
    GLdouble b = m(0, 1);
    GLdouble c = m(0, 2);
    GLdouble d = m(0, 3);

    GLdouble e = m(1, 0);
    GLdouble f = m(1, 1);
    GLdouble g = m(1, 2);
    GLdouble h = m(1, 3);

    GLdouble i = m(2, 0);
    GLdouble j = m(2, 1);
    GLdouble k = m(2, 2);
    GLdouble l = m(2, 3);

    GLdouble det = -c*f*i + b*g*i + c*e*j - a*g*j - b*e*k + a*f*k;

    if(-IALGEBRA_EPSILON < det &&
       det < IALGEBRA_EPSILON)
    {
	// Zero determinant means non-invertable matrix.
	assert(0);
	const static GLdouble zeroMatrix[16] = {0.0, 0.0, 0.0, 0.0,
					       0.0, 0.0, 0.0, 0.0,
					       0.0, 0.0, 0.0, 0.0,
					       0.0, 0.0, 0.0, 0.0};
	return IMatrix(zeroMatrix);
    }  

    GLdouble gj = g * j;
    GLdouble fk = f * k;
    GLdouble cj = c * j;
    GLdouble bk = b * k;
    GLdouble cf = c * f;
    GLdouble bg = b * g;
    GLdouble gi = g * i;
    GLdouble ek = e * k;
    GLdouble ci = c * i;
    GLdouble ak = a * k;
    GLdouble ce = c * e;
    GLdouble ag = a * g;
    GLdouble fi = f * i;
    GLdouble ej = e * j;
    GLdouble bi = b * i;
    GLdouble aj = a * j;
    GLdouble be = b * e;
    GLdouble af = a * f;

    GLdouble ma = (-gj + fk) / det;
    GLdouble mb = ( cj - bk) / det;
    GLdouble mc = (-cf + bg) / det;
    GLdouble md = (d*gj - h*cj - d*fk + h*bk + l*cf - l*bg) / det;

    GLdouble me = ( gi - ek) / det;
    GLdouble mf = (-ci + ak) / det;
    GLdouble mg = ( ce - ag) / det;
    GLdouble mh = (-d*gi + h*ci + d*ek - h*ak - l*ce + l*ag) / det;

    GLdouble mi = (-fi + ej) / det;
    GLdouble mj = ( bi - aj) / det;
    GLdouble mk = (-be + af) / det;
    GLdouble ml = (d*fi - h*bi - d*ej + h*aj + l*be - l*af) / det;
    
    return IMatrix(ma, mb, mc, md,
		   me, mf, mg, mh,
		   mi, mj, mk, ml,
		   0.0, 0.0, 0.0, 1.0);
}

#endif
