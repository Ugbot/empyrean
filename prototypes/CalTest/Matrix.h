#ifndef MATRIX_H
#define MATRIX_H

#include <algorithm>
#include "Vector.h"

template <class T=double>
union Matrix
{
    T V[16];
    T v[4][4];

    Matrix(){}
    Matrix(T* d)
    {
        std::copy(d,d+16,V);
    }

    template <class U>
        Matrix(const Matrix<U>& m)
    {
        for (int i=0; i<16; i++)
            V[i]=m.v[i];
    }

    template <class U>
    inline Vector<U> operator * (const Vector<U>& vec) const
    {
        return Vector<U>(
                vec.x*v[0][0] + vec.y*v[1][0] + vec.z*v[2][0] + v[3][0],  // pretend that w is equal to 1
                vec.x*v[0][1] + vec.y*v[1][1] + vec.z*v[2][1] + v[3][1],
                vec.x*v[0][2] + vec.y*v[1][2] + vec.z*v[2][2] + v[3][2]
                );
    }

    inline Matrix<T> operator * (const Matrix<T>& vec) const
    {
        Matrix<T> out;
        std::fill(out.V, out.V + 16, 0);

        for (int col = 0; col < 4; col++)
        {
            for (int row = 0; row < 4; row++)
            {
                // add col + row

                for (int i = 0; i < 4; i++)
                {
                    out.v[col][row] += v[i][row] * vec.v[col][i];
                }
            }
        }

        return out;
    }
};

#endif