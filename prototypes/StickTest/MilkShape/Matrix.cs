using System;

namespace StickTest.MilkShape
{
	/// <summary>
	/// WHATISTHEMATRIX
	/// 
	/// <p>Highly specialized for 3D things.</p>
	/// </summary>
	public class Matrix
	{
        const int width =4;
        const int height=4;

        // I'd like to make this const. :\
        public static Matrix identity=new Matrix(
            1,0,0,0,
            0,1,0,0,
            0,0,1,0,
            0,0,0,1
            );

        double[] v;
		public Matrix()
		{
            v=new double[width*height];
            this[0,3]=0;
            this[1,3]=0;
            this[2,3]=0;
            this[3,3]=1;
        }

        public Matrix(params double[] V) : this()
        {
            Copy(V);
        }

        public Matrix(Matrix m) : this(m.v){}

        public void Copy(double[] V)
        {
            for (int i=0; i<V.Length; i++)
                v[i]=V[i];

            // Row 3 must be 0 0 0 1
            this[0,3]=0;
            this[1,3]=0;
            this[2,3]=0;
            this[3,3]=1;
        }

        public void Copy(Matrix m)
        {
            Copy(m.v);
        }

        public void Transpose()
        {
            for (int y=0; y<height; y++)
                for (int x=y+1; x<width; x++)
                {
                    double d=this[y,x];
                    this[y,x]=this[x,y];
                    this[x,y]=d;
                }
        }

        public double this[int x, int y]
        {
            get
            {   
                if (x<0 || y<0 || x>=width || y>=height)    throw new Exception("You're fucking up the matrix shit, yo"); 
                return v[x*height+y];
            }
            set
            {   
                if (x<0 || y<0 || x>=width || y>=height)    throw new Exception("You're fucking up the matrix shit, yo");
                v[x*height+y]=value;
            }
        }

        public double[] Values { get { return v; } } // mainly provided for more efficient OpenGL interoperation.

        public static Matrix operator + (Matrix l,Matrix r)
        {
            double[] v=new double[width*height];
            for (int i=0; i<v.Length; i++)
                v[i]=l.v[i]+r.v[i];
            
            Matrix m=new Matrix();
            m.v=v;

            return m;
        }

        public static Matrix operator + (Matrix l,Vector r)
        {
            Matrix m=new Matrix(l);
            for (int i=0; i<width; i++)
            {
                m[i,0]+=r.x;
                m[i,1]+=r.y;
                m[i,2]+=r.z;
            }

            return m;
        }

        public static Matrix operator + (Matrix l,double r)
        {
            Matrix m=new Matrix(l);
            for (int i=0; i<m.v.Length; i++)
                m.v[i]+=r;
            return m;
        }

        public static Matrix operator * (Matrix l,Matrix r)
        {
            Matrix m=new Matrix();
            
            // ignoring row 3 cause I'm lazy.
            /*for (int i=0; i<height; i++)
            {
                m[i,0] =  l[i,0]*r[0,0] + l[i,1]*r[1,0] + l[i,2]*r[2,0] + l[i,3]*r[3,0];
                m[i,1] =  l[i,0]*r[0,1] + l[i,1]*r[1,1] + l[i,2]*r[2,1] + l[i,3]*r[3,1];
                m[i,2] =  l[i,0]*r[0,2] + l[i,1]*r[1,2] + l[i,2]*r[2,2] + l[i,3]*r[3,2];

            }            
            */
            for (int i=0; i<16; i++)    m.v[i]=0;
            for (int i=0; i<height; i++)
                for (int j=0; j<width; j++)
                    for (int k=0; k<width; k++)
                        m[i,j]+=l[k,j]*r[i,k];
            return m;
        }

        public static Vector operator * (Matrix l,Vector r)
        {
            return new Vector(
                r.x*l[0,0] + r.y*l[1,0] + r.z*l[2,0] + l[3,0],  // pretend that w is equal to 1
                r.x*l[0,1] + r.y*l[1,1] + r.z*l[2,1] + l[3,1],
                r.x*l[0,2] + r.y*l[1,2] + r.z*l[2,2] + l[3,2]
                );  // ignoring row 3 again
        }

        public static Matrix operator * (Matrix l,double r)
        {
            Matrix m=new Matrix(l);
            for (int i=0; i<m.v.Length; i++)
                m.v[i]*=r;
            return m;
        }

        /*public static bool operator == (Matrix l,Matrix r)
        {
            return l.Equals(r);
        }

        public static bool operator != (Matrix l,Matrix r)
        {
            return !l.Equals(r);
        }*/

        public static Matrix TranslationMatrix(double x,double y,double z)
        {
            return new Matrix(
                1,0,0,0,
                0,1,0,0,
                0,0,1,0,
                x,y,z,1
                );
        }

        public static Matrix TranslationMatrix(Vector v)
        {
            return TranslationMatrix(v.x,v.y,v.z);
        }


        /// <summary>
        /// JL deborked this.  Rockon. :D
        /// </summary>
        public static Matrix RotationMatrix(double theta,double phi,double rho)
        {
            Vector v0 = new Vector(0, 0, 0);
            Matrix mx = Matrix.RotationMatrix(v0, new Vector(1, 0, 0), theta);
            Matrix my = Matrix.RotationMatrix(v0, new Vector(0, 1, 0), phi);
            Matrix mz = Matrix.RotationMatrix(v0, new Vector(0, 0, 1), rho);
            return mz * my * mx;
        }

        /// <summary>
        /// Kudos to JL for this as well.
        /// </summary>
        /// <param name="p">Point to rotate around.</param>
        /// <param name="v">Axis to rotate around.</param>
        /// <param name="angle">Magnitude of rotation.</param>
        /// <returns>A matrix that will do the transform.</returns>
        public static Matrix RotationMatrix(Vector p,Vector v,double angle)
        {
            double halfAngle = -angle / 2.0;
            double cosAngle  = Math.Cos(halfAngle);
            double sinAngle  = Math.Sin(halfAngle);

            double l = v.Length;

            // Set up quaternion

            //assert(fabs(l) >= IALGEBRA_EPSILON);
            double qw = cosAngle;
            double qx = sinAngle * v.x / l;
            double qy = sinAngle * v.y / l;
            double qz = sinAngle * v.z / l;

            // Quaternion to matrix routine from Watt and Watt, p.363

            double xs = qx * 2.0;
            double ys = qy * 2.0;
            double zs = qz * 2.0;

            double wx = qw * xs;
            double wy = qw * ys;
            double wz = qw * zs;
            double xx = qx * xs;
            double xy = qx * ys;
            double xz = qx * zs;
            double yy = qy * ys;
            double yz = qy * zs;
            double zz = qz * zs;

            double a = 1.0 - (yy + zz);
            double b = xy + wz;
            double c = xz - wy;

            double d = xy - wz;
            double e = 1.0 - (xx + zz);
            double f = yz + wx;

            double g = xz + wy;
            double h = yz - wx;
            double i = 1.0 - (xx + yy);

            // Multiply in translation matrices

            Matrix quatRot=new Matrix(
                a, d, g, 0.0,
                b, e, h, 0.0,
                c, f, i, 0.0,
                0.0, 0.0, 0.0, 1.0);
                //a, b, c, 0.0,
                //d, e, f, 0.0,
                //g, h, i, 0.0,

            Matrix transMat=Matrix.TranslationMatrix(p);
            Matrix invTransMat=Matrix.TranslationMatrix(-p.x, -p.y, -p.z);

            return (transMat * quatRot * invTransMat);
        }

        public double[] ToGLMatrix()
        {
            //return (double[])v.Clone();
            return v;
        }

/*       public override bool Equals(object o)
        {
            Matrix m=(Matrix)o;
            for (int i=0; i<width*height; i++)
                if (v[i]!=m.v[i])
                    return false;
            return true;
        }
*/
        public override string ToString()
        {
            string s="";

            for (int y=0; y<height; y++)
            {
                for (int x=0; x<width; x++)
                    s+=String.Format("{0}\t",this[x,y]);
                s+='\n';
            }

            return s;
        }

        public static void Test()
        {
            Matrix a=TranslationMatrix(1,2,3);
            Matrix b=identity;
            Matrix c=a*b;
            if (!c.Equals(a))
                throw new Exception("Internal error: Matrix code fucked.  Matrix m*identity should equal m.  It's not.");

            Console.WriteLine("{0}*\n{1}=\n{2}",a,b,a*b);

            a=RotationMatrix(Math.PI,0,0);
            Vector v=new Vector(1,1,1);
            Console.WriteLine(a);
            Console.WriteLine(a*v);

            Console.WriteLine(RotationMatrix(0,Math.PI,0)*v);
            Console.WriteLine(RotationMatrix(0,0,Math.PI)*v);
        }
	}
}
