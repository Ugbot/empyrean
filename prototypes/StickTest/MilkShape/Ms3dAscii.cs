using System;
using System.IO;
using System.Collections;

namespace StickTest.MilkShape
{
	/// <summary>
	/// Summary description for ms3dascii.
	/// </summary>
	public class Ms3dAscii
	{
        static Vertex GetVertex(string[] tokens,ref int idx)
        {
            int flags=Convert.ToInt32(tokens[idx++]);
            double x=Convert.ToDouble(tokens[idx++]);
            double y=Convert.ToDouble(tokens[idx++]);
            double z=Convert.ToDouble(tokens[idx++]);
            double u=Convert.ToDouble(tokens[idx++]);
            double v=Convert.ToDouble(tokens[idx++]);
            int bone=Convert.ToInt32(tokens[idx++]);

            return new Vertex(flags,x,y,z,u,v,bone);
        }

        static Mesh.Triangle GetTri(string[] tokens,ref int idx)
        {
            Mesh.Triangle tri=new Mesh.Triangle();
            tri.i=new int[3];
            tri.n=new int[3];

            tri.flags=Convert.ToInt32(tokens[idx++]);
            tri.i[0]=Convert.ToInt32(tokens[idx++]);
            tri.i[1]=Convert.ToInt32(tokens[idx++]);
            tri.i[2]=Convert.ToInt32(tokens[idx++]);
            tri.n[0]=Convert.ToInt32(tokens[idx++]);
            tri.n[1]=Convert.ToInt32(tokens[idx++]);
            tri.n[2]=Convert.ToInt32(tokens[idx++]);

            tri.smoothinggroup=Convert.ToInt32(tokens[idx++]);

            return tri;
        }

        static Mesh GetMesh(string[] tokens,ref int idx)
        {
            Mesh m=new Mesh();

            m.name=tokens[idx++];
            m.flags=Convert.ToUInt32(tokens[idx++]);
            m.materialidx=Convert.ToInt32(tokens[idx++]);

            m.vertices=new Vertex[Convert.ToInt32(tokens[idx++])];
            for (int i=0; i<m.vertices.Length; i++)
                m.vertices[i]=GetVertex(tokens,ref idx);

            m.normals=new Normal[Convert.ToInt32(tokens[idx++])];
            for (int i=0; i<m.normals.Length; i++)
            {
                m.normals[i].x=Convert.ToDouble(tokens[idx++]);
                m.normals[i].y=Convert.ToDouble(tokens[idx++]);
                m.normals[i].z=Convert.ToDouble(tokens[idx++]);
            }

            m.triangles=new Mesh.Triangle[Convert.ToInt32(tokens[idx++])];
            for (int i=0; i<m.triangles.Length; i++)
                m.triangles[i]=GetTri(tokens,ref idx);

            return m;
        }

        static Material GetMaterial(string[] tokens,ref int idx)
        {
            Material m=new Material();

            m.name=tokens[idx++];
            double[] f=new double[16];
            for (int i=0; i<16; i++)    
                f[i]=Convert.ToDouble(tokens[idx++]);
            m.ambient  =new double[] { f[ 0],f[ 1],f[ 2],f[ 3] };
            m.diffuse  =new double[] { f[ 4],f[ 5],f[ 6],f[ 7] };
            m.specular =new double[] { f[ 8],f[ 9],f[10],f[11] };
            m.emmissive=new double[] { f[12],f[13],f[14],f[15] };
            m.shininess=Convert.ToDouble(tokens[idx++]);
            m.transparency=Convert.ToDouble(tokens[idx++]);
            m.colourmap=tokens[idx++];
            m.alphamap=tokens[idx++];

            return m;
        }

        static Joint PassJoint(string[] tokens,ref int idx)    // token that joint.
        {
            string name=tokens[idx++];
            string parentname=tokens[idx++];
            int flags=Convert.ToInt32(tokens[idx++]);
            double x=Convert.ToDouble(tokens[idx++]);
            double y=Convert.ToDouble(tokens[idx++]);
            double z=Convert.ToDouble(tokens[idx++]);
            double rotx=Convert.ToDouble(tokens[idx++]);
            double roty=Convert.ToDouble(tokens[idx++]);
            double rotz=Convert.ToDouble(tokens[idx++]);

            Key[] poskeys=new Key[Convert.ToInt16(tokens[idx++])];
            for (int i=0; i<poskeys.Length; i++)
            {
                poskeys[i].time=Convert.ToDouble(tokens[idx++]);
                double tx=Convert.ToDouble(tokens[idx++]);
                double ty=Convert.ToDouble(tokens[idx++]);
                double tz=Convert.ToDouble(tokens[idx++]);
                poskeys[i].v=new Vector(tx,ty,tz);
            }

            Key[] rotkeys=new Key[Convert.ToInt16(tokens[idx++])];
            for (int i=0; i<rotkeys.Length; i++)
            {
                rotkeys[i].time=Convert.ToDouble(tokens[idx++]);
                double tx=Convert.ToDouble(tokens[idx++]);
                double ty=Convert.ToDouble(tokens[idx++]);
                double tz=Convert.ToDouble(tokens[idx++]);
                rotkeys[i].v=new Vector(tx,ty,tz);
            }

            return new Joint(name,parentname,flags,x,y,z,rotx,roty,rotz,poskeys,rotkeys);
        }

        static void Assert(bool b)
        {
#if DEBUG
            if (!b)
                throw new Exception("Milkshape.Model: Assertion failed");
#endif
        }

        static string[] Tokenize(FileStream f)
        {
            StreamReader file=new StreamReader(f);
            ArrayList tok=new ArrayList();

            while (true)
            {
                string ln=file.ReadLine();
                if (ln==null)
                    break;

                string[] line=ln.Split(' ','\n','\t','\r');
                for (int i=0; i<line.Length; i++)
                {
                    string s=line[i];

                    if (s=="//" || s=="")
                        break;

                    // Handle quoted strings
                    if (s.StartsWith("\""))
                    {
                        while (!s.EndsWith("\""))
                            s+=line[++i];
                        s=s.Substring(1,s.Length-2);    // strip the "s
                    }

                    tok.Add(s);
                }
            }

            return (string[])tok.ToArray(typeof(string));
        }

        // I'M A MODEL, YOU KNOW WHAT I MEAN \ I DO MY LITTLE TURN ON THE CATWALK
        public static Model Load(string fname)
        {
            Model model=new Model();

            FileStream file=File.Open(fname,FileMode.Open);
            string[] tokens=Tokenize(file);

            int idx=0;

            Assert(tokens[idx++]=="Frames:");
            model.frames=Convert.ToInt32(tokens[idx++]);

            Assert(tokens[idx++]=="Frame:");
            model.frame=Convert.ToInt32(tokens[idx++]);

            Assert(tokens[idx++]=="Meshes:");
            model.meshes=new Mesh[Convert.ToInt32(tokens[idx++])];
            for (int i=0; i<model.meshes.Length; i++)
                model.meshes[i]=GetMesh(tokens,ref idx);

            Assert(tokens[idx++]=="Materials:");
            model.materials=new Material[Convert.ToInt32(tokens[idx++])];
            for (int i=0; i<model.materials.Length; i++)
                model.materials[i]=GetMaterial(tokens,ref idx);
    
            Assert(tokens[idx++]=="Bones:");
            model.joints=new Joint[Convert.ToInt32(tokens[idx++])];
            for (int i=0; i<model.joints.Length; i++)
                model.joints[i]=PassJoint(tokens,ref idx);

            return model;
        }
	}
}
