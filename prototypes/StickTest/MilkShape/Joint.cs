using System;
using System.Collections;

namespace StickTest.MilkShape
{
    public struct Key
    {
        public double time;
        public Vector v;
    }

    public class Joint
    {
        public string name;
        public string parentname;

        public int flags;
    
        internal ArrayList children=new ArrayList();

        Key[] poskeys;
        Key[] rotkeys;
        public Vector initpos;
        public Vector initrot;

        public Joint(string n,string parent,int f,double x,double y,double z,double rx,double ry,double rz,Key[] poskeys,Key[] rotkeys) 
            : this (n,parent,f,new Vector(x,y,z),new Vector(rx,ry,rz),poskeys,rotkeys){}

        public Joint(string n,string parent,int f,Vector initpos,Vector initrot,Key[] poskeys,Key[] rotkeys)
        {
            name=n;
            parentname=parent;
            flags=f;

            this.poskeys=poskeys;
            this.rotkeys=rotkeys;
            this.initpos=initpos;
            this.initrot=initrot;
        }

        public Key[] PosKeys { get { return poskeys; } }
        public Key[] RotKeys { get { return rotkeys; } }
    }
}
