using System;

namespace StickTest.MilkShape
{
    public class Quaternion
    {
        double w;
        Vector v;

        public Quaternion()
        {
            w=0;
            v=new Vector(0,0,0);
        }

        public Quaternion(double W,Vector V)
        {
            w=W;
            v=new Vector(V);
        }

        public Quaternion(double W,double X,double Y,double Z)
        {
            w=W;
            v=new Vector(X,Y,Z);
        }

        public double Length
        {
            get 
            {   
                double l=v.Length;
                return Math.Sqrt(w*w + l*l);
            }
        }

        public static explicit operator Vector(Quaternion q)
        {
            return q.v;
        }

        public static Quaternion operator * (Quaternion l,Quaternion r)
        {
            Quaternion q=new Quaternion();
            q.w = (l.w*r.w) - (l.v|r.v);
            q.v = (l.w*r.v) + (r.w*l.v) + (l.v^r.v);
            return q;
        }

        public static Quaternion RotateQuat(Vector v,double theta)
        {
            return new Quaternion(Math.Cos(theta/2),v*Math.Sin(theta/2));
        }
    }
}
