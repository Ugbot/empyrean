#ifndef VECTOR_H
#define VECTOR_H

template <class T=double>
union Vector
{
    struct
    {
        T x,y,z;
    };

    T v[3];

    Vector() : x(0),y(0),z(0)
    {}

    Vector(T X,T Y,T Z)
        : x(X),y(Y),z(Z)
    {}

    Vector(const T V[3])
    {
        v[0]=V[0];
        v[1]=V[1];
        v[2]=V[2];
    }

    template <class U>
        Vector(const Vector<U>& V)
    {
        v[0]=V.v[0];
        v[1]=V.v[1];
        v[3]=V.v[2];
    }

    inline T& operator [] (int i)
    {
        return v[i];
    }

    inline T operator [] (int i) const
    {
        return v[i];
    }

    inline T Dot(const Vector& vec) const
    {
        return x*vec.x+y*vec.y+z*vec.z;
    }

    inline void Normalize()
    {
        T l=(T)sqrt(x*x+y*y+z*z);
        x/=l;   y/=l;   z/=l;
    }
};

#endif