using System;
using System.IO;
using System.Text;
using System.Collections;

namespace StickTest.MilkShape
{
    public class Vertex
    {
        public int flags;
        public double x,y,z,u,v;
        public int jointidx;
        public Joint joint;

        public Vertex(){}
        public Vertex(int f,double X,double Y,double Z,double U,double V,int j)
        {
            flags=f;
            x=X;    y=Y;    z=Z;
            u=U;    v=V;
            jointidx=j;
            joint=null;
        }
    }

    public struct Normal
    {
        public double x,y,z;
    }

    public class Mesh
    {
        public class Triangle
        {
            public int flags;
            public int[] i;   // vertex index (haha that rhymes)
            public int[] n;   // normal index
            public int smoothinggroup;

            public Triangle(){}
            public Triangle(Triangle t)
            {
                flags=t.flags;
                i=(int[])t.i.Clone();
                n=(int[])t.n.Clone();
                smoothinggroup=t.smoothinggroup;
            }
        }

        public string name;
        public uint flags;
        public int materialidx;

        public Vertex[] vertices;
        public Normal[] normals;
        public Triangle[] triangles;

        public Mesh(){}

        public Mesh(Mesh m) // copy constructor
        {
            name=m.name;
            flags=m.flags;
            materialidx=m.materialidx;

            vertices=(Vertex[])m.vertices.Clone();
            normals=(Normal[])m.normals.Clone();

            triangles=new Triangle[m.triangles.Length];
            for (int i=0; i<triangles.Length; i++)
                triangles[i]=new Triangle(m.triangles[i]);  // copy
        }
    }

    public class Material
    {
        public string name;
        public double[] ambient;
        public double[] diffuse;
        public double[] specular;
        public double[] emmissive;
        public double shininess;
        public double transparency;
        public string colourmap;
        public string alphamap;
    }

    public class Model
    {
        public int frames;
        public int frame;
        double time;
        
        public Mesh[] meshes;
        public Material[] materials;
        public Joint[] joints;              // SMOKIN UP YO
        public Joint rootbone;

        /// <summary>
        /// Animates the model
        /// </summary>
        /// <param name="t">The number of seconds to animate</param>
        public void Animate(double t)
        {
            foreach (Joint j in joints)
            {
                j.Animate(t);
            }
        }

        internal Model(){}

        public double Time
        {
            get {   return time;    }
            set {   time=value;     }
        }
    }
}