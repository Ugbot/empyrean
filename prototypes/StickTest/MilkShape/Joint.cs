using System;
using System.Collections;

namespace StickTest.MilkShape
{
    public struct Key
    {
        public double time;
        public Vector v;
    }

    /// <summary>
    /// Isolating one component of the interpolation that goes on.  Head hurting from trying to do both.
    /// </summary>
    public class KeyInterpolator
    {
        double time;
        int nextkey;

        Key[] keys;

        Vector cur;
        Vector _base;       // base is a keyword

        Vector delta;       // amount of change that needs to happen between the last key, and the next

        public KeyInterpolator(Key[] k,Vector basevec)
        {
            keys=k;
            
            cur=new Vector(0,0,0);
            _base=new Vector(basevec);

            NextKey=0;
        }

        /// <summary>
        /// Animates, yo.
        /// </summary>
        /// <param name="td">time delta; the amount of animating to do</param>
        public void Animate(double td)
        {
            switch (1)
            {
                case 1:
                    if (time+td>keys[nextkey].time)
                    {
                        double _t=keys[nextkey].time-time;

                        cur+=delta*_t;                  // get the rest of this keyframe added in

                            td-=keys[nextkey].time-time;    // adjust time delta to add other keyframes
                        time=keys[nextkey].time;

                        NextKey++;
                        goto case 1;    // GOTO lives on.
                    }
                    break;
            }

            cur+=delta*td;
            time+=td;
        }

        int NextKey
        {
            get {   return nextkey; }
            set
            {
                nextkey=value;
                if (nextkey>=keys.Length)
                {
                    time=0;
                    nextkey=0;
                    cur.x=cur.y=cur.z=0;    // reset; flush any accumulated floating point errors
                }

                delta=(keys[nextkey].v-cur)*(1/(keys[nextkey].time-time));
            }
        }

        public Vector Current   {   get {   return cur;     }   }
        public Vector Base      {   get {   return _base;   }   } 

        public override string ToString()
        {
            return String.Format("{0},{1},{2}\n   {3},{4},{5}\n   {6}",cur.x,cur.y,cur.z,delta.x,delta.y,delta.z,time);
        }
    }

    public class Joint
    {
        public string name;
        public string parentname;

        public int flags;
    
        internal ArrayList children=new ArrayList();

        KeyInterpolator pos;
        KeyInterpolator rot;

        public Joint(string n,string parent,int f,double x,double y,double z,double rx,double ry,double rz,Key[] poskeys,Key[] rotkeys) 
            : this (n,parent,f,new Vector(x,y,z),new Vector(rx,ry,rz),poskeys,rotkeys){}

        public Joint(string n,string parent,int f,Vector initpos,Vector initdir,Key[] poskeys,Key[] rotkeys)
        {
            name=n;
            parentname=parent;
            flags=f;

            pos=new KeyInterpolator(poskeys,initpos);
            rot=new KeyInterpolator(rotkeys,initdir);
        }

        public void Animate(double t)
        {
            pos.Animate(t);
            rot.Animate(t);
        }

        public void Reset(){}

        public KeyInterpolator Position  {   get {   return pos;    }   }
        public KeyInterpolator Direction {   get {   return rot;    }   }
    }
}
