//#define FULLSCREEN

using System;
using System.Drawing;
using System.Windows.Forms;
using System.ComponentModel;
using System.Collections;
using CsGL.OpenGL;
using CsGL.Util;

using StickTest.MilkShape;


namespace StickTest
{
    public class MainClass
    {
        Form form;
        OpenGLControl gl;
        Model model;
        Vector[][] transformedvertices;
        Texture backdrop;
        Tex1D shadetex;

        const int xres=1024;
        const int yres=768;
        bool kill=false;

        // camera
        double x=0;
        double y=0;
        double z=-70;
        double xangle=90;
        double yangle=0;
        double zangle=0;
        double time=0;
        int dragx,dragy;    // the point at which the user began dragging
        bool dragging;      // whether we're dragging around or not

        // position/orientation of the model
        const double startx=-380;
        const double endx=380;
        const double vel=1;
        Vector modelpos=new Vector(startx,-210,-555);
        Vector lightvec=new Vector(0.5,0.7,0);
        
        void InitGL()
        {
            lightvec.Normalize();
            GL.glClearColor(0,0,0.4f,1);
            GL.glClearDepth(1);
            GL.glEnable(GL.GL_DEPTH_TEST);
            GL.glDepthFunc(GL.GL_LEQUAL);
            GL.glHint(GL.GL_PERSPECTIVE_CORRECTION_HINT,GL.GL_NICEST);
            GL.glHint(GL.GL_LINE_SMOOTH_HINT,GL.GL_NICEST);
            GL.glEnable(GL.GL_LINE_SMOOTH);

            GL.glViewport(0,0,xres,yres);
            GL.glMatrixMode(GL.GL_PROJECTION);
            GL.glLoadIdentity();
            GL.gluPerspective(45,1.0*xres/yres,0.1,800);
            //GL.gluOrtho2D(-380,380,10,-100);
            GL.glMatrixMode(GL.GL_MODELVIEW);
            GL.glLoadIdentity();

            /*float[] ambient= new float[] { 0.5f, 0.5f, 0.5f, 1.0f };
            float[] diffuse= new float[] { 1,1,1,1 };
            float[] lightpos=new float[] { 0,0,2,1 };

            GL.glLightfv(GL.GL_LIGHT1,GL.GL_AMBIENT,ambient);
            GL.glLightfv(GL.GL_LIGHT1,GL.GL_DIFFUSE,diffuse);
            GL.glLightfv(GL.GL_LIGHT1,GL.GL_POSITION,lightpos);
            GL.glEnable(GL.GL_LIGHTING);
            GL.glEnable(GL.GL_LIGHT1);
            GL.glPointSize(10);*/

            GL.glEnable(GL.GL_COLOR_MATERIAL);

            backdrop=new Texture("backdrop.jpg");
            shadetex=new Tex1D();
        }

        public MainClass(string s)
        {
#if !FULLSCREEN
            form=new Form();
            form.ClientSize=new Size(xres,yres);
#else
            form=new ScreenForm(new ScreenSetting(1024,768,32));
#endif
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

            transformedvertices=new Vector[model.meshes.Length][];
            for (int i=0; i<transformedvertices.Length; i++)
                transformedvertices[i]=new Vector[model.meshes[i].vertices.Length];
            for (int i=0; i<model.meshes.Length; i++)
                for (int j=0; j<model.meshes[i].vertices.Length; j++)
                {
                    Vertex v=model.meshes[i].vertices[j];

                    transformedvertices[i][j]=new Vector(v.x,v.y,v.z);
                }
            UndeformJoint(model.rootbone, Matrix.identity);
        }


        void Draw(Mesh mesh,int idx)
        {
            /*
             * By far, not the most effective way to do this.
             * The most obvious thing to optimize is to construct
             * A bunch of triangle lists, and fans.  And draw those
             * instead.  WAAAAY more efficient.
             * Second, use C++ and not C#.
             * Also vertex/index buffers/arrays.
             */

            double[] d=new Double[15];
            GL.glGetDoublev(GL.GL_MODELVIEW_MATRIX,d);
            Matrix m=new Matrix(d);
            m[3,0]=m[3,1]=m[3,2]=0; // don't care about translation.  just want rotation

            GL.glEnable(GL.GL_TEXTURE_1D);
            shadetex.Bind();

            GL.glColor3f(1,1,1);
            GL.glBegin(GL.GL_TRIANGLES);
            foreach (Mesh.Triangle tri in mesh.triangles)
            {
                for (int i=0; i<3; i++)
                {
                    Normal n=mesh.normals[tri.n[i]];
                    Vector v=transformedvertices[idx][tri.i[i]];

                    Vector normal=m*new Vector(n.x,n.y,n.z);
                    double light=lightvec.Dot(normal); // say it alound "light vec dot dot normal" :D
                    if (light<0) light=0;

                    GL.glTexCoord1d(light);
                    GL.glNormal3d(n.x,n.y,n.z);
                    GL.glVertex3d(v.x,v.y,v.z);
                }
            }
            GL.glEnd();

            GL.glDisable(GL.GL_TEXTURE_1D);
        }

        void UndeformJoint(Joint j, Matrix parentm)
        {
            if (j==null)
                return;

            Matrix invTrans = Matrix.TranslationMatrix(-j.Position.Base.x,-j.Position.Base.y,-j.Position.Base.z);
            Matrix invRot = Matrix.RotationMatrix(j.Direction.Base.x,j.Direction.Base.y,j.Direction.Base.z);
            invRot.Transpose();
            Matrix m = invRot * invTrans * parentm;

            for (int i=0; i<model.meshes.Length; i++)
            {
                Mesh mesh=model.meshes[i];

                for (int k=0; k<mesh.vertices.Length; k++)
                {
                    if (mesh.vertices[k].joint==j)
                    {
                        Vertex v=mesh.vertices[k];
                        Vector vec = m*new Vector(v.x,v.y,v.z);
                        v.x=vec.x;
                        v.y=vec.y;
                        v.z=vec.z;
                    }
                }
            }

            foreach (Joint k in j.children)
            {
                UndeformJoint(k,m);
            }
        }

        void DeformJoint(Joint j,Matrix parentm)
        {
            if (j==null)
                return;

            Matrix m=
                parentm *
                Matrix.TranslationMatrix(j.Position.Base.x,j.Position.Base.y,j.Position.Base.z) *
                Matrix.RotationMatrix(j.Direction.Base.x,j.Direction.Base.y,j.Direction.Base.z) *
                Matrix.TranslationMatrix(j.Position.Current.x, j.Position.Current.y, j.Position.Current.z) *
                Matrix.RotationMatrix(j.Direction.Current.x, j.Direction.Current.y, j.Direction.Current.z);


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

        void Set2D()
        {
            GL.glLoadIdentity();
            GL.glMatrixMode(GL.GL_PROJECTION);
            GL.glPushMatrix();
            GL.glLoadIdentity();
            GL.gluOrtho2D(0,1,1,0);
            GL.glDisable(GL.GL_DEPTH_TEST);
        }

        void Unset2D()
        {
            GL.glPopMatrix();
            GL.glEnable(GL.GL_DEPTH_TEST);
            GL.glMatrixMode(GL.GL_MODELVIEW);
        }

        void Render()
        {
            GL.glClear(GL.GL_DEPTH_BUFFER_BIT | GL.GL_COLOR_BUFFER_BIT);
            GL.glLoadIdentity();

            Set2D();
            GL.glEnable(GL.GL_TEXTURE_2D);
            backdrop.Bind();
            GL.glColor3f(1,1,1);
            GL.glBegin(GL.GL_QUADS);
            GL.glTexCoord2d(0,0);       GL.glVertex2i(0,0);
            GL.glTexCoord2d(1,0);       GL.glVertex2i(1,0);
            GL.glTexCoord2d(1,1);       GL.glVertex2i(1,1);
            GL.glTexCoord2d(0,1);       GL.glVertex2i(0,1);
            GL.glEnd();
            GL.glDisable(GL.GL_TEXTURE_2D);
            Unset2D();

            GL.glBindTexture(GL.GL_TEXTURE_2D,0);

            GL.glTranslated(x,y,z);
            GL.glTranslated(modelpos.x,modelpos.y,modelpos.z);
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
            const double inc=0.3;

            while (!kill)
            {
                time+=inc;
                while (time>30) time-=30;
                model.Animate(inc);
                DeformJoint(model.rootbone,Matrix.identity);

                modelpos.x+=vel;
                if (modelpos.x>endx) modelpos.x=startx;

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

            /*Matrix m1 = Matrix.RotationMatrix(1.5, 0, 0);
            Matrix m2 = Matrix.RotationMatrix(0, 1.5, 0);
            Vector v1 = new Vector(1, 0, 0);
            Vector v2 = (m1 * m2) * v1;
            Vector v3 = m1 * (m2 * v1);
            
            Console.WriteLine(m1);
            Console.WriteLine(m2);
            Console.WriteLine(v1);
            Console.WriteLine(v2);
            Console.WriteLine(v3);*/
            //Console.WriteLine(m4);

            string s=args.Length>0?args[0]:"walk.ms3d.txt";
            new MainClass(s).Execute();
        }
    }
}
