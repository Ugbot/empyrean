using System;
using System.Collections;
using StickTest.MilkShape;

namespace StickTest
{
	/// <summary>
	/// Summary description for AnimState.
	/// </summary>
	public class AnimState
	{
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
                            if (keys.Length==1) return;

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
                        time=1;
                        nextkey=0;
                    }

                    if (time==keys[nextkey].time)
                    {
                        delta=keys[nextkey].v;
                    }
                    else
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

        public class JointState
        {
            public KeyInterpolator pos,rot;
            public string name;
            public ArrayList children=new ArrayList();

            public JointState(Joint j)
            {
                pos=new KeyInterpolator(j.PosKeys,j.initpos);
                rot=new KeyInterpolator(j.RotKeys,j.initrot);
                name=j.name;
            }

            public void Animate(double td)
            {
                pos.Animate(td);
                rot.Animate(td);
            }
        }

        Model model;
        JointState[] joints;
        JointState rootjoint;

        Vector[][] transformedvertices;
        Vector[][] untransformedvertices;

        JointState FindJointByName(string name)
        {
            foreach (JointState js in joints)
                if (js.name==name)
                    return js;
            return null;
        }

        public AnimState(Model m)
		{
            model=m;
            joints=new JointState[m.joints.Length];
            for (int i=0; i<joints.Length; i++)
                joints[i]=new JointState(m.joints[i]);

            /*
             * Reconstruct the bone heirarchy.
             * This isn't technically "correct", as it makes assumptions about the order which milkshape writes the bones.  There's
             * no reason why a bone's parent couldn't appear after it in this list.
             */
            for (int i=0; i<joints.Length; i++)
            {
                JointState j=FindJointByName(m.joints[i].parentname);
                if (j==null)
                    rootjoint=joints[i];            // if we can't find the parent, we assume that this is the root bone (probably not the Best Thing, but it works for now)
                else
                    j.children.Add(joints[i]);
            }

            /*
             * Initialize the current vertex arrangement.  Basically a copy operation.
             */
            transformedvertices=new Vector[m.meshes.Length][];
            untransformedvertices=new Vector[m.meshes.Length][];
            for (int i=0; i<m.meshes.Length; i++)
            {
                Vertex[] verts=m.meshes[i].vertices;
                Vector[] v=new Vector[verts.Length];
                for (int j=0; j<v.Length; j++)
                    v[j]=new Vector(verts[j].x,verts[j].y,verts[j].z);

                transformedvertices[i]=v;
                untransformedvertices[i]=new Vector[verts.Length];  // filled up in UndeformJoint
            }

            UndeformJoint(rootjoint,Matrix.identity);
		}

        void UndeformJoint(JointState j, Matrix parentm)
        {
            Matrix invTrans = Matrix.TranslationMatrix(-j.pos.Base.x,-j.pos.Base.y,-j.pos.Base.z);
            Matrix invRot   = Matrix.RotationMatrix   ( j.rot.Base.x, j.rot.Base.y, j.rot.Base.z);
            invRot.Transpose();
            Matrix m = invRot * invTrans * parentm;

            for (int i=0; i<model.meshes.Length; i++)
            {
                Mesh mesh=model.meshes[i];

                for (int k=0; k<mesh.vertices.Length; k++)
                {
                    Vertex v=mesh.vertices[k];
                    if (joints[v.jointidx]==j)
                    {
                        untransformedvertices[i][k] = m*new Vector(v.x,v.y,v.z);
                    }
                }
            }

            foreach (JointState k in j.children)
            {
                UndeformJoint(k,m);
            }
        }

        void DeformJoint(JointState j,Matrix parentm)
        {
            if (j==null)
                return;

            Matrix m=
                parentm *
                Matrix.TranslationMatrix(j.pos.Base.x,j.pos.Base.y,j.pos.Base.z) *
                Matrix.RotationMatrix(j.rot.Base.x,j.rot.Base.y,j.rot.Base.z) *
                Matrix.TranslationMatrix(j.pos.Current.x, j.pos.Current.y, j.pos.Current.z) *
                Matrix.RotationMatrix(j.rot.Current.x, j.rot.Current.y, j.rot.Current.z);


            for (int i=0; i<model.meshes.Length; i++)
            {
                Mesh mesh=model.meshes[i];

                for (int k=0; k<mesh.vertices.Length; k++)
                {
                    Vector v=untransformedvertices[i][k];

                    if (joints[mesh.vertices[k].jointidx]==j)
                    {
                        transformedvertices[i][k]=m*new Vector(v.x,v.y,v.z);
                    }
                }
            }

            foreach (JointState k in j.children)
            {
                DeformJoint(k,m);
            }
        }

        public void Animate(double dt)
        {
            foreach (JointState js in joints)
                js.Animate(dt);

            DeformJoint(rootjoint,Matrix.identity);
        }
        public Vector[] GetVerts(int i)
        {
            return transformedvertices[i];
        }
    }
}
