using System;

namespace StickTest.MilkShape
{
	/// <summary>
	/// Math vectors.  w,x,y,z
	/// </summary>
    public class Vector
    {
        public double x,y,z;

        public Vector(double X,double Y,double Z)
        {
            x=X;    y=Y;    z=Z;
        }

        public Vector(Vector v) : this (v.x,v.y,v.z)
        {}

        public double Length
        {
            get {   return Math.Sqrt(x*x+y*y+z*z);  }
        }

        public void Copy(Vector v)
        {
            x=v.x;  y=v.y;  z=v.z;
        }


        public override string ToString()
        {
            return String.Format("{0},{1},{2}",x,y,z);
        }

        public void Normalize()
        {
            double r=Length;
            x/=r;
            y/=r;
            z/=r;
        }

        public double Dot(Vector b)
        {
            return x*b.x + y*b.y + z*b.z;
        }

        public static double Dot(Vector a,Vector b)
        {
            return a.Dot(b);
        }

        public Vector Cross(Vector b)
        {
            return new Vector(
                y*b.z - z*b.y,
                z*b.x - x*b.z,
                x*b.y - y*b.x);
        }

        public static Vector Cross(Vector a,Vector b)
        {
            return a.Cross(b);
        }

        public static double operator | (Vector l,Vector r)
        {
            return l.Dot(r);
        }

        public static Vector operator ^ (Vector l,Vector r)
        {
            return l.Cross(r);
        }

        public static Vector operator + (Vector l,Vector r)
        {
            return new Vector(l.x+r.x,l.y+r.y,l.z+r.z);
        }

        public static Vector operator - (Vector l,Vector r)
        {
            return new Vector(l.x-r.x,l.y-r.y,l.z-r.z);
        }

        public static Vector operator * (Vector l,double r)
        {
            return new Vector(l.x*r,l.y*r,l.z*r);
        }

        public static Vector operator * (double l,Vector r)
        {
            return r*l;
        }
    }
}
