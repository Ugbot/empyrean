#include "IAlgebra.h"


GLdouble IMatrix::identityMatrix[16] = {1.0, 0.0, 0.0, 0.0,
					0.0, 1.0, 0.0, 0.0,
					0.0, 0.0, 1.0, 0.0,
					0.0, 0.0, 0.0, 1.0};

const static GLdouble zeroMatrix[16] = {0.0, 0.0, 0.0, 0.0,
				        0.0, 0.0, 0.0, 0.0,
				        0.0, 0.0, 0.0, 0.0,
				        0.0, 0.0, 0.0, 0.0};

IMatrix gaussJordanInvert(const IMatrix& m)
{
    GLdouble row1[8] = {m(0,0), m(0,1), m(0,2), m(0,3), 1.0, 0.0, 0.0, 0.0};
    GLdouble row2[8] = {m(1,0), m(1,1), m(1,2), m(1,3), 0.0, 1.0, 0.0, 0.0};
    GLdouble row3[8] = {m(2,0), m(2,1), m(2,2), m(2,3), 0.0, 0.0, 1.0, 0.0};
    GLdouble row4[8] = {m(3,0), m(3,1), m(3,2), m(3,3), 0.0, 0.0, 0.0, 1.0};

    GLdouble *rows[4] = {row1, row2, row3, row4};
    GLdouble *swapRow;
    GLdouble scaleValue;
    int i, j, k;

    // Reduce the left matrix to upper-triangulated form

    for(i = 0; i < 4; i ++)
    {
	// Find the row with the greatest magnitude value for column i

	GLdouble maxVal = 0.0;
	int maxRow = -1;
	for(j = i; j < 4; j ++)
	{
	    if(rows[j][i] > maxVal + IALGEBRA_EPSILON ||
		rows[j][i] < -maxVal - IALGEBRA_EPSILON)
	    {
		if(rows[j][i] < 0)
		    maxVal = -rows[j][i];
		else
		    maxVal = rows[j][i];
		maxRow = j;
	    }
	}
	
	if(maxRow < 0)
	{
	    // If column is all zeros, matrix is non-invertable
	    return IMatrix(zeroMatrix);
	}

	// Swap the selected row to be the ith row
	swapRow = rows[maxRow];
	rows[maxRow] = rows[i];
	rows[i] = swapRow;
	
	// Remove the ith values from all rows > i
	for(j = i + 1; j < 4; j ++)
	{
	    assert(fabs(rows[i][i]) > IALGEBRA_EPSILON);
	    scaleValue = rows[j][i] / rows[i][i];
	    for(k = i; k < 8; k ++)
	    {
		rows[j][k] -= rows[i][k] * scaleValue;
	    }
	}
	
	// Scale row i so that the ith column is 1
	scaleValue = rows[i][i];
	assert(fabs(scaleValue) > IALGEBRA_EPSILON);
	for(j = i; j < 8; j ++)
	{
	    rows[i][j] /= scaleValue;
	}
    }

    // Reduce the left matrix to an identity matrix
    for(i = 4 - 1; i >= 0; i --)
    {
	for(j = i - 1; j >= 0; j --)
	{
	    scaleValue = rows[j][i];
	    
	    for(k = i; k < 8; k ++)
	    {
		rows[j][k] -= rows[i][k] * scaleValue;
	    }
	}
    }

    GLdouble ma = rows[0][4];
    GLdouble mb = rows[0][5];
    GLdouble mc = rows[0][6];
    GLdouble md = rows[0][7];

    GLdouble me = rows[1][4];
    GLdouble mf = rows[1][5];
    GLdouble mg = rows[1][6];
    GLdouble mh = rows[1][7];

    GLdouble mi = rows[2][4];
    GLdouble mj = rows[2][5];
    GLdouble mk = rows[2][6];
    GLdouble ml = rows[2][7];

    GLdouble mm = rows[3][4];
    GLdouble mn = rows[3][5];
    GLdouble mo = rows[3][6];
    GLdouble mp = rows[3][7];

    return IMatrix(ma, mb, mc, md,
		   me, mf, mg, mh,
		   mi, mj, mk, ml,
		   mm, mn, mo, mp);
}
