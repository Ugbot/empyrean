//#define FULLSCREEN

using System;
using System.IO;
using System.Drawing;
using System.Windows.Forms;
using System.ComponentModel;
using System.Collections;
using System.Runtime.InteropServices;
using CsGL.OpenGL;
using CsGL.Util;

using StickTest.MilkShape;


namespace StickTest
{
    public class MainClass : GL
    {
        [DllImport("winmm")]
        static extern int timeGetTime();

        Form form;
        OpenGLControl gl;
        Model model;
        AnimState animstate;
        AnimState a2;

        Texture backdrop;
        Texture modeltex;
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
        int dragx,dragy;    // the point at which the user began dragging
        bool dragging;      // whether we're dragging around or not
        bool drawwireframe=true;
        bool toonshade=true;

        // position/orientation of the model
        /*        const double startx=-380;
                const double endx=380;
                const double vel=1;*/
        const double startx=0,endx=0,vel=0;
        Vector modelpos=new Vector(startx,-210,-555);
        Vector lightvec=new Vector(0.5,0.5,0.5);
        
        void InitGL()
        {
            lightvec.Normalize();
            glClearColor(0,0,0.4f,1);
            glClearDepth(1);
            glEnable(GL_DEPTH_TEST);
            glDepthFunc(GL_LEQUAL);
            glHint(GL_PERSPECTIVE_CORRECTION_HINT,GL_NICEST);
            glHint(GL_LINE_SMOOTH_HINT,GL_NICEST);
            glEnable(GL_LINE_SMOOTH);

            glViewport(0,0,xres,yres);
            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            gluPerspective(45,1.0*xres/yres,0.1,800);
            glMatrixMode(GL_MODELVIEW);
            glLoadIdentity();

            float[] ambient= new float[] { 0.5f, 0.5f, 0.5f, 1.0f };
            float[] diffuse= new float[] { 1,1,1,1 };
            float[] lightpos=new float[] { 0,0,2,1 };

            glLightfv(GL_LIGHT1,GL_AMBIENT,ambient);
            glLightfv(GL_LIGHT1,GL_DIFFUSE,diffuse);
            glLightfv(GL_LIGHT1,GL_POSITION,lightpos);
            glEnable(GL_LIGHT1);

            glEnable(GL_CULL_FACE);
            glCullFace(GL_BACK);
            glColor3f(1,1,1);

            glHint(GL_LINE_SMOOTH_HINT,GL_NICEST);
            glEnable(GL_LINE_SMOOTH);
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            glLineWidth(1.5f);

            backdrop=new Texture("backdrop.jpg");
            modeltex=new Texture("generic_male.png");
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
            animstate=new AnimState(model);
            a2=new AnimState(model);
        }

        /*
         * By far, not the most effective way to do this.
         * The most obvious thing to optimize is to construct
         * A bunch of triangle lists, and fans.  And draw those
         * instead.  WAAAAY more efficient.
         * Second, use C++ and not C#.
         * Also vertex/index buffers/arrays.
         */
        void DrawGLShade(Mesh mesh,AnimState.TriangleList[] lists,Vector[] verts)
        {
            //*            
            modeltex.Bind();
            glBegin(GL_TRIANGLES);
            foreach (Mesh.Triangle tri in mesh.triangles)
            {
                for (int i=0; i<3; i++)
                {
                    Normal n=mesh.normals[tri.n[i]];
                    Vector v=verts[tri.i[i]];
                    Vertex vert=mesh.vertices[tri.i[i]];

                    glTexCoord2d(vert.u,vert.v);
                    glNormal3d(n.x,n.y,n.z);
                    glVertex3d(v.x,v.y,v.z);
                }
            }
            glEnd();
            /*/

            modeltex.Bind();

            foreach (AnimState.TriangleList curlist in lists)
            {
                glBegin(GL_TRIANGLE_STRIP);
                for (int i=0; i<curlist.vertices.Length; i++)
                {
                    Normal n=mesh.normals[curlist.normals[i]];
                    Vector v=verts[curlist.vertices[i]];

                    glNormal3d(n.x,n.y,n.z);
                    glVertex3d(v.x,v.y,v.z);
                }
                glEnd();
            }
            //*/
        }

        /*
         * This isn't technically as correct as it could be, since the normals aren't deformed along with the
         * vertices when the mesh is animated.  Probably faster, though, it doesn't look bad at all so far.
         */
        void DrawToonShade(Mesh mesh,AnimState.TriangleList[] lists,Vector[] verts)
        {
            //*
            Matrix m=new Matrix();
            glGetDoublev(GL_MODELVIEW_MATRIX,m.Values);
            m[3,0]=m[3,1]=m[3,2]=0; // don't care about translation.  just want rotation

            glActiveTexture(GL_TEXTURE0);
            glBindTexture(GL_TEXTURE_1D,shadetex.Handle);
            glEnable(GL_TEXTURE_1D);
            glActiveTexture(GL_TEXTURE1);
            glBindTexture(GL_TEXTURE_2D,modeltex.Handle);
            glEnable(GL_TEXTURE_2D);

            glBegin(GL_TRIANGLES);
            foreach (Mesh.Triangle tri in mesh.triangles)
            {
                for (int i=0; i<3; i++)
                {
                    Normal n=mesh.normals[tri.n[i]];
                    Vector v=verts[tri.i[i]];
                    Vertex vert=mesh.vertices[tri.i[i]];

                    Vector normal=m*new Vector(n.x,n.y,n.z);
                    double light= lightvec | normal; // dot product
                    if (light<0) light=0;

                    glMultiTexCoord1dARB(GL_TEXTURE0,light);
                    glMultiTexCoord2dARB(GL_TEXTURE1,vert.u,vert.v);
                    glVertex3d(v.x,v.y,v.z);
                }
            }
            glEnd();

            glBindTexture(GL_TEXTURE_2D,0);
            glDisable(GL_TEXTURE_2D); // turn off multitexturing
            glActiveTexture(GL_TEXTURE0);
            glBindTexture(GL_TEXTURE_1D,0);
            glDisable(GL_TEXTURE_1D);
            /*/

            Matrix m=new Matrix();
            glGetDoublev(GL_MODELVIEW_MATRIX,m.Values);
            m[3,0]=m[3,1]=m[3,2]=0; // don't care about translation.  just want rotation

            shadetex.Bind();

            foreach (AnimState.TriangleList list in lists)
            {
                glBegin(GL_TRIANGLE_STRIP);

                for (int i=0; i<list.vertices.Length; i++)
                {
                    Normal n=mesh.normals[list.normals[i]];
                    Vector v=verts[list.vertices[i]];

                    Vector normal=m*new Vector(n.x,n.y,n.z);
                    double light= lightvec | normal; // dot product
                    if (light<0) light=0;

                    glTexCoord1d(light);
                    glVertex3d(v.x,v.y,v.z);
                }

                glEnd();
            }
            //*/
        }

        void DrawOutLine(Mesh mesh,Vector[] verts)
        {
            glPolygonMode(GL_BACK,GL_LINE);
            glCullFace(GL_FRONT);
            glDepthFunc(GL_LEQUAL);

            glBegin(GL_TRIANGLES);
            foreach (Mesh.Triangle tri in mesh.triangles)
            {
                for (int i=0; i<3; i++)
                {
                    Vector v=verts[tri.i[i]];
                    glVertex3d(v.x,v.y,v.z);
                }
            }
            glEnd();

            glDepthFunc(GL_LESS);
            glCullFace(GL_BACK);
            glPolygonMode(GL_BACK,GL_FILL);
        }

        void Set2D()
        {
            glLoadIdentity();
            glMatrixMode(GL_PROJECTION);
            glPushMatrix();
            glLoadIdentity();
            gluOrtho2D(0,1,1,0);
            glDisable(GL_DEPTH_TEST);
        }

        void Unset2D()
        {
            glPopMatrix();
            glEnable(GL_DEPTH_TEST);
            glMatrixMode(GL_MODELVIEW);
        }

        void Render()
        {
            glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
            glLoadIdentity();

            Set2D();
            glEnable(GL_TEXTURE_2D);
            backdrop.Bind();
            glBegin(GL_QUADS);
            glTexCoord2d(0,0);       glVertex2i(0,0);
            glTexCoord2d(0,1);       glVertex2i(0,1);
            glTexCoord2d(1,1);       glVertex2i(1,1);
            glTexCoord2d(1,0);       glVertex2i(1,0);
            glEnd();
            glDisable(GL_TEXTURE_2D);
            Unset2D();

            glBindTexture(GL_TEXTURE_2D,0);


            glTranslated(x,y,z);
            glTranslated(modelpos.x,modelpos.y,modelpos.z);
            glRotated(xangle,0,1,0);
            glRotated(yangle,1,0,0);
            glRotated(zangle,0,0,1);

            int i=0;
            if (toonshade)
            {
                foreach (Mesh m in model.meshes)
                {
                    try
                    {
                        DrawToonShade(m,animstate.GetTriangleLists(i),animstate.GetVerts(i));
                    }
                    catch (Exception){}
                    i++;
                }
            }
            else
            {
                glEnable(GL_TEXTURE_2D);
                glEnable(GL_LIGHTING);
                foreach (Mesh m in model.meshes)
                {
                    DrawGLShade(m,animstate.GetTriangleLists(i),animstate.GetVerts(i));
                    i++;
                }

                glDisable(GL_LIGHTING);
                glDisable(GL_TEXTURE_2D);
            }

            if (drawwireframe)
            {
                i=0;
                glColor3f(0,0,0);
                foreach (Mesh m in model.meshes)
                {
                    DrawOutLine(m,animstate.GetVerts(i));
                    i++;
                }
                glColor3f(1,1,1);
            }

            gl.Context.SwapBuffer();
        }

        void Execute()
        {
            const double inc=0.3;

            int time=timeGetTime();

            int curfps=0;
            int curframes=0;
            int fpstime=timeGetTime();

            while (!kill)
            {
                int t=time;
                time=timeGetTime();
                animstate.Animate(inc);

                modelpos.x+=vel;
                if (modelpos.x>endx) modelpos.x=startx;

                Render();
                curframes++;

                if (time-fpstime>1000)
                {
                    fpstime=time;
                    curfps=curframes;
                    curframes=0;
                    form.Text=String.Format("{0},{1},{2}    {3},{4},{5}     {6} fps",x,y,z,xangle,yangle,zangle,curfps);
                }
                
                glFlush();
                Application.DoEvents();
            }

            glFlush();
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

            switch (e.KeyCode)
            {
                case Keys.A:
                    if (e.KeyCode==Keys.A)
                    {
                        if ((Control.ModifierKeys & Keys.Shift) != 0)
                            z+=v;
                        else
                            z-=v;
                    }
                    break;

                case Keys.NumPad4:  x+=v;   break;
                case Keys.NumPad6:  x-=v;   break;
                case Keys.NumPad2:  y+=v;   break;
                case Keys.NumPad8:  y-=v;   break;

                case Keys.O:
                    drawwireframe=!drawwireframe;
                    break;

                case Keys.S:
                    toonshade=!toonshade;
                    break;

                case Keys.V:
                    foreach (Mesh m in model.meshes)
                    {
                        for (int i=0; i<m.normals.Length; i++)
                        {
                            Normal n=m.normals[i];
                            m.normals[i].x=-n.x;
                            m.normals[i].y=-n.y;
                            m.normals[i].z=-n.z;
                        }
                    }
                    break;
            }

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
            string appdir=Path.GetDirectoryName(Application.ExecutablePath);

            string s=args.Length>0?args[0]:"walk.ms3d.txt";

            // hack
            if (!File.Exists(s))
                Directory.SetCurrentDirectory(appdir);

            new MainClass(s).Execute();
        }
    }
}
