#define USE_GL_STACK

using System;
using System.Drawing;
using System.Windows.Forms;
using System.ComponentModel;
using System.Collections;
using CsGL.OpenGL;

using StickTest.MilkShape;

namespace StickTest
{
    public class MainClass
    {
        Form form;
        OpenGLControl gl;
        Model model;
        Vector[][] transformedvertices;

        const int xres=1024;
        const int yres=768;
        bool kill=false;

        // camera
        double x=0;
        double y=0;
        double z=-70;
        double xangle=0;
        double yangle=0;
        double zangle=0;
        double time=0;
        int dragx,dragy;    // the point at which the user began dragging
        bool dragging;      // whether we're dragging around or not

        void InitGL()
        {
            GL.glClearColor(0,0,0.4f,1);
            //GL.glShadeModel(GL.GL_FLAT);
            GL.glClearDepth(1);
            GL.glEnable(GL.GL_DEPTH_TEST);
            GL.glDepthFunc(GL.GL_LEQUAL);
            GL.glHint(GL.GL_PERSPECTIVE_CORRECTION_HINT,GL.GL_NICEST);

            GL.glViewport(0,0,xres,yres);
            GL.glMatrixMode(GL.GL_PROJECTION);
            GL.glLoadIdentity();
            GL.gluPerspective(45,1.0*xres/yres,0.1,400);
            GL.glMatrixMode(GL.GL_MODELVIEW);
            GL.glLoadIdentity();

            float[] ambient= new float[] { 0.5f, 0.5f, 0.5f, 1.0f };
            float[] diffuse= new float[] { 1,1,1,1 };
            float[] lightpos=new float[] { 0,0,2,1 };

            GL.glLightfv(GL.GL_LIGHT1,GL.GL_AMBIENT,ambient);
            GL.glLightfv(GL.GL_LIGHT1,GL.GL_DIFFUSE,diffuse);
            GL.glLightfv(GL.GL_LIGHT1,GL.GL_POSITION,lightpos);
            GL.glEnable(GL.GL_LIGHTING);
            GL.glEnable(GL.GL_LIGHT1);
            GL.glPointSize(10);
        }

        public MainClass(string s)
        {
            form=new Form();
            form.ClientSize=new Size(xres,yres);
            form.Closing+=new CancelEventHandler(OnClosing);

            gl=new OpenGLControl();
            gl.Dock=DockStyle.Fill;

            gl.KeyDown  +=new KeyEventHandler  (KeyDown);
            gl.MouseDown+=new MouseEventHandler(MouseDown);
            gl.MouseUp  +=new MouseEventHandler(MouseUp);
            gl.MouseMove+=new MouseEventHandler(MouseMove);

            form.Controls.Add(gl);
            form.Show();

            InitGL();

            model=Ms3dAscii.Load(s);
        }

        void SetupJoints()
        {
            for (int i=0; i<model.meshes.Length; i++)
            {
                Mesh mesh=model.meshes[i];

                foreach (Vertex v in mesh.vertices)
                {
                    if (v.joint!=null)
                    {
                        Vector r=v.joint.Direction.Base;

                        // AHA.  Revelation.
                        // I need to inverse multiply these vertices by the parent joints' matrices too!
                        // TODO: find some time to actually do it. -_-
                        Vector vec=new Vector(
                            v.x-v.joint.Position.Base.x,
                            v.y-v.joint.Position.Base.y,
                            v.z-v.joint.Position.Base.z
                            );

                        Matrix matrix=Matrix.RotationMatrix(r.x,r.y,r.z);
                        matrix.Transpose();
                        vec=matrix * vec;

                        v.x=vec.x;
                        v.y=vec.y;
                        v.z=vec.z;
                    }
                }
            }

            transformedvertices=new Vector[model.meshes.Length][];
            for (int i=0; i<transformedvertices.Length; i++)
                transformedvertices[i]=new Vector[model.meshes[i].vertices.Length];
            for (int i=0; i<model.meshes.Length; i++)
                for (int j=0; j<model.meshes[i].vertices.Length; j++)
                {
                    Vertex v=model.meshes[i].vertices[j];

                    transformedvertices[i][j]=new Vector(v.x,v.y,v.z);
                }
        }

        void Draw(Mesh m,int idx)
        {
            /*
             * By far, not the most effective way to do this.
             * The most obvious thing to optimize is to construct
             * A bunch of triangle lists, and fans.  And draw those
             * instead.  WAAAAY more efficient.
             * Second, use C++ and not C#.
             */

            GL.glColor4ub(255,255,255,255);
            GL.glBegin(GL.GL_TRIANGLES);
            foreach (Mesh.Triangle tri in m.triangles)
            {
                for (int i=0; i<3; i++)
                {
                    Normal n=m.normals[tri.n[i]];
                    Vector v=transformedvertices[idx][tri.i[i]];//m.vertices[tri.i[i]];

                    GL.glNormal3d(n.x,n.y,n.z);
                    GL.glVertex3d(v.x,v.y,v.z);
                }
            }
            GL.glEnd();
        }


        void DeformJoint(Joint j,Matrix parentm)
        {
            if (j==null)
                return;

            Matrix m=
                //Matrix.identity;
                parentm *
                Matrix.RotationMatrix(j.Direction.Base.x,j.Direction.Base.y,j.Direction.Base.z) *
                Matrix.TranslationMatrix(j.Position.Base.x,j.Position.Base.y,j.Position.Base.z) *
                Matrix.RotationMatrix(j.Direction.Current.x, j.Direction.Current.y, j.Direction.Current.z) *
                Matrix.TranslationMatrix(j.Position.Current.x, j.Position.Current.y, j.Position.Current.z);


            for (int i=0; i<model.meshes.Length; i++)
            {
                Mesh mesh=model.meshes[i];

                for (int k=0; k<mesh.vertices.Length; k++)
                {
                    if (mesh.vertices[k].joint==j)
                    {
                        Vertex v=mesh.vertices[k];
                        transformedvertices[i][k]=m*new Vector(v.x,v.y,v.z);
                    }
                }
            }

            foreach (Joint k in j.children)
            {
                DeformJoint(k,m);
            }
        }

        void Render()
        {
            GL.glClear(GL.GL_DEPTH_BUFFER_BIT | GL.GL_COLOR_BUFFER_BIT);
            GL.glLoadIdentity();
            GL.glTranslated(x,y,z);
            GL.glRotated(xangle,0,1,0);
            GL.glRotated(yangle,1,0,0);
            GL.glRotated(zangle,0,0,1);

            int i=0;
            foreach (Mesh m in model.meshes)
                Draw(m,i++);
                
            gl.Context.SwapBuffer();
        }

        void Execute()
        {
            const double inc=0.03;

            while (!kill)
            {
                time+=inc;
                if (Math.Abs(time-15)<inc)
                {
                    Console.WriteLine("---");
                    foreach (Joint j in model.joints)
                        Console.WriteLine(j.Direction);
                }
                while (time>30) time-=30;
                //model.Animate(inc);
                DeformJoint(model.rootbone,Matrix.identity);

                Render();

                form.Text=String.Format("{0},{1},{2}    {3},{4},{5}   t={6}",x,y,z,xangle,yangle,zangle,(int)time);
                Application.DoEvents();
            }

            GL.glFlush();
            gl.Dispose();
        }


        void MouseDown(object o,MouseEventArgs e)
        {
            dragging=true;
            dragx=e.X-(int)xangle;
            dragy=(int)yangle-e.Y;
        }

        void MouseUp(object o,MouseEventArgs e)
        {
            dragging=false;
        }

        void MouseMove(object o,MouseEventArgs e)
        {
            if (dragging)
            {
                xangle=e.X-dragx;
                yangle=e.Y+dragy;
                gl.Invalidate();
            }
        }

        void KeyDown(object o,KeyEventArgs e)
        {
            const double v=5;
            if (e.KeyCode==Keys.A)
            {
                if ((Control.ModifierKeys & Keys.Shift) != 0)
                    z+=v;
                else
                    z-=v;
            }
            if (e.KeyCode==Keys.NumPad4)
                x+=v;
            if (e.KeyCode==Keys.NumPad6)
                x-=v;
            if (e.KeyCode==Keys.NumPad2)
                y+=v;
            if (e.KeyCode==Keys.NumPad8)
                y-=v;

            gl.Invalidate();
        }


        void OnClosing(object o,CancelEventArgs e)
        {
            e.Cancel=true;
            form.Closing-=new CancelEventHandler(OnClosing);
            kill=true;
        }

        public static void Main(string[] args)
        {
/*            if (args.Length==0)
            {
                Matrix.Test();
                return;
            }*/

            string s=args.Length>0?args[0]:"head1.txt";
            new MainClass(s).Execute();
        }
    }
}
