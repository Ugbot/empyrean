// I am a bad, bad boy.  I am assuming that GL_ARB_multitexture is supported.  Shame on me.

// standard
#include <cassert>
#include <map>
#include <string>
#include <conio.h>
#include <stdio.h>
#include <direct.h>

// 3rd party
#include <SDL.h>
#include <SDL_opengl.h>
#include <cal3d.h>
#include <cg/cg.h>
#include <cg/cggl.h>

// 1st party :)
#include "Vector.h"
#include "Matrix.h"
#include "Model.h"
#include "TriList.h"

PFNGLACTIVETEXTUREARBPROC glActiveTexture;
PFNGLCLIENTACTIVETEXTUREARBPROC glClientActiveTexture;
PFNGLMULTITEXCOORD1FARBPROC glMultiTexCoord1f;
PFNGLMULTITEXCOORD2FARBPROC glMultiTexCoord2f;
PFNGLMULTITEXCOORD2FVARBPROC glMultiTexCoord2fv;

enum ShadeMode
{
    sm_none,
    sm_normal,
    sm_software,
    sm_vertex,
    sm_fragment,
    sm_outline,
    sm_count // total number of shade modes.
};

const char* modeNames[] =
{
    "No shading",
    "Normal OpenGL shading",
    "Software (sort of) cell shading",
    "Per-vertex cell shading",
    "Per-pixel cell shading",
    "Outlining"
};

// data
SDL_Surface* screen;
const int xres=640,yres=480;
Model model;
GLuint shadetex;
int shadeMode = 0;
bool outline = false;
bool usevertexarrays = false;
bool paused = false;
bool usetrilist = true;
float lodlevel = 1.0f;
Vector<float> lightvec(1,0,1);
std::map<std::string,GLuint> textures;
std::vector<TriList> trilists;

struct
{
    float x,y,z;
    float rx,ry,rz;
} camera;

struct
{   
    bool b;
    int x,y;
    float sx,sy;
} drag;

// proto

void Init();
void Tick(int);
void Render();
void LoadTextures();

// code

template <class T>
void assign(T& v,char* a)
{
    void* p=SDL_GL_GetProcAddress(a);
    v=(T)p;
}

int main(int argc,char* args[])
{
	SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER
#ifdef _DEBUG
        // sdl parachute screws up VS's debugger
        | SDL_INIT_NOPARACHUTE
#endif
        );
    atexit(SDL_Quit);

    chdir("data");
    lightvec.Normalize();

    screen=SDL_SetVideoMode(xres,yres,32,SDL_OPENGL);

    assign(glActiveTexture,"glActiveTextureARB");
    assign(glClientActiveTexture,"glClientActiveTextureARB");
    assign(glMultiTexCoord1f,"glMultiTexCoord1fARB");
    assign(glMultiTexCoord2f,"glMultiTexCoord2fARB");
    assign(glMultiTexCoord2fv,"glMultiTexCoord2fvARB");

    glViewport(0,0,xres,yres);
    glClearColor(0,0,0.4f,1);
    glClearDepth(1);
    glEnable(GL_DEPTH_TEST);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT,GL_NICEST);
//    glHint(GL_LINE_SMOOTH_HINT,GL_NICEST);
    glHint(GL_POLYGON_SMOOTH_HINT,GL_NICEST);
//    glEnable(GL_LINE_SMOOTH);    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45,1.0*xres/yres,0.1,800);
    glMatrixMode(GL_MODELVIEW);

    float ambient[]=  { 0.5f, 0.5f, 0.5f, 1.0f };
    float diffuse[]=  { 1,1,1,1 };

    glLightfv(GL_LIGHT1,GL_AMBIENT,ambient);
    glLightfv(GL_LIGHT1,GL_DIFFUSE,diffuse);
    glLightfv(GL_LIGHT1,GL_POSITION,lightvec.v);
    glEnable(GL_LIGHT1);

    glEnable(GL_TEXTURE_2D);
    
    glFrontFace(GL_CW);

    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);

    {
        const int texSize = 32;
        unsigned int pixels[texSize];
        int i=0;
        while (i==0) pixels[i++]=0xFF606060;
        while (i<13) pixels[i++]=0xFF808080;
        while (i<texSize) pixels[i++]=0xFFFFFFFF;

        glGenTextures(1,&shadetex);
        glBindTexture(GL_TEXTURE_1D,shadetex);
        glTexImage1D(GL_TEXTURE_1D,0,GL_RGBA,texSize,0,GL_RGBA,GL_UNSIGNED_BYTE,pixels);
        glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    }

    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnable(GL_TEXTURE_2D);

    int time=SDL_GetTicks();
    bool kill=false;
    int fps=0;
    int frames=0;

    Init();

    int t2=SDL_GetTicks();

    while (!kill)
    {
        int t=SDL_GetTicks();
        
        Tick(t-t2);
        Render();
        frames++;
        t2=t;

        if (t-time>1000)
        {
            fps=frames;
            frames=0;
            time=t;
            char c[255];
            sprintf(c,"fps: %i    LOD: %f",fps,lodlevel);
            SDL_WM_SetCaption(c,0);
        }

        SDL_Event evt;
        while (SDL_PollEvent(&evt))
        {
            switch (evt.type)
            {
            case SDL_QUIT:  kill=true;  break;
            case SDL_KEYDOWN:
                switch (evt.key.keysym.sym)
                {
                    
                case SDLK_ESCAPE:
                    kill=true;
                    break;

                case SDLK_s:
                    shadeMode = (shadeMode + 1) % sm_count;
                    printf("Shade mode %i - %s\n", shadeMode, modeNames[shadeMode]);
                    break;

                case SDLK_o:
                    outline=!outline;
                    break;

                case SDLK_v:
                    usevertexarrays=!usevertexarrays;
                    break;

                case SDLK_t:
                    usetrilist=!usetrilist;
                    break;

                case SDLK_RIGHTBRACKET:
                    lodlevel+=0.05f;
                    if (lodlevel>1) lodlevel=1;
                    model.GetModel().setLodLevel(lodlevel);
                    break;

                case SDLK_LEFTBRACKET:
                    lodlevel-=0.05f;
                    if (lodlevel<0) lodlevel=0;
                    model.GetModel().setLodLevel(lodlevel);
                    break;

                case SDLK_SPACE:
                    paused ^= true;
                    break;
                }
                break;

            case SDL_MOUSEBUTTONDOWN:
                drag.b=true;
                SDL_GetMouseState(&drag.x,&drag.y);
                drag.sx=camera.rx;
                drag.sy=camera.ry;
                break;

            case SDL_MOUSEBUTTONUP:
                drag.b=false;
                break;

            case SDL_MOUSEMOTION:
                {
                    if (drag.b)
                    {
                        int x,y;
                        SDL_GetMouseState(&x,&y);
                        camera.rx=drag.sx+(x-drag.x)/5;
                        camera.ry=drag.sy+(y-drag.y)/5;
                    }
                    break;
                }
            }
        }
    }

    return 0;
}

void Init()
{
    model.Load("paladin.cfg");
    model.GetModel().getMixer()->blendCycle(0, 1, 4.0f);
    camera.x=camera.y=0; camera.z=-200;
    camera.rx=camera.ry=camera.rz=0;
    camera.ry = -90;

/*    try
    {
        trilists=LoadTriList("paladin_body.trilist");
    }
    catch (std::runtime_error)
    {
        usetrilist=false;
        throw;
    }*/
}

void Tick(int time)
{
    const float speed = 1.0f; // 0.05f;
    int n;
    unsigned char* keys=SDL_GetKeyState(&n);

    if (keys[SDLK_UP])      camera.y+=speed;;
    if (keys[SDLK_DOWN])    camera.y-=speed;;
    if (keys[SDLK_LEFT])    camera.x-=speed;;
    if (keys[SDLK_RIGHT])   camera.x+=speed;;
    if (keys[SDLK_a])
    {
        if (keys[SDLK_LSHIFT] || keys[SDLK_RSHIFT])
            camera.z-=speed;
        else
            camera.z+=speed;
    }

    if (!paused)
        model.update((float)time/1000.0f);
}

struct GLShade
{
    inline void begin()
    {
        glEnable(GL_LIGHTING);
        glEnable(GL_LIGHT0);
    }

    inline void end()
    {
        glDisable(GL_LIGHTING);
    }

    inline void drawvert(const float* normal,const float* vert, const float* texcoords)
    {
        glTexCoord2fv(texcoords);
        glNormal3fv(normal);
        glVertex3fv(vert);
    }
};

struct NoShade
{
    inline void begin(){}
    inline void end(){}
    inline void drawvert(const float* normal, const float* vert, const float* texcoords)
    {
        glTexCoord2fv(texcoords);
        glVertex3fv(vert);
    }
};

struct CellShade
{
    Matrix<float> m;

    inline void begin()
    {
        glGetFloatv(GL_MODELVIEW_MATRIX,m.V);
        m.v[3][0]=m.v[3][1]=m.v[3][2]=0;    // wipe the translation part out

        glActiveTexture(GL_TEXTURE1_ARB);
        glBindTexture(GL_TEXTURE_1D,shadetex);
        glEnable(GL_TEXTURE_1D);
        glActiveTexture(GL_TEXTURE0_ARB);
    }

    inline void end()
    {
        glActiveTexture(GL_TEXTURE1_ARB);
        glBindTexture(GL_TEXTURE_1D,0);
        glDisable(GL_TEXTURE_1D);
        glActiveTexture(GL_TEXTURE0_ARB);
    }

    inline void drawvert(const float* normal,const float* vert, const float* texcoords)
    {
        Vector<float> n(m * Vector<float>(normal));

        float l = n.Dot(lightvec);
        if (l < 0) l = 0;

        glMultiTexCoord2fv(GL_TEXTURE0_ARB, texcoords);
        glMultiTexCoord1f(GL_TEXTURE1_ARB,l);
        glVertex3fv(vert);
    }
};

// Requires a GF3+, or Radeon 9500 or better.  Fast.
struct VertexProgramCellShade
{
    static VertexProgramCellShade* _instance;
    CGprofile _profile;
    CGcontext _context;
    CGprogram _program;

    CGparameter _shaderLightVec;

private:
    VertexProgramCellShade()
    {
        _context = cgCreateContext();
        _profile = cgGLGetLatestProfile(CG_GL_VERTEX);
        cgGLSetOptimalOptions(_profile);
        _program = cgCreateProgramFromFile(
            _context,
            CG_SOURCE,
            "cellshade.cg",
            _profile,
            "main",
            0);

        CGerror err = cgGetError();
        if (err != CG_NO_ERROR)
        {
            printf("CG error: %s\n", cgGetErrorString(err));
            if (err = CG_COMPILER_ERROR)
                printf("%s\n", cgGetLastListing(_context));
        }

        cgGLLoadProgram(_program);

        _shaderLightVec = cgGetNamedParameter(_program, "lightVec");
    }

    static void destroy() { delete _instance; }
public:

    static VertexProgramCellShade& instance()
    {
        if (!_instance)
        {
            _instance = new VertexProgramCellShade();
            atexit(destroy);
        }
        return *_instance;
    }

    inline void begin()
    {
        cgGLSetParameter4d(_shaderLightVec, 1, 0, 1, 0); // arbitrary
        cgGLBindProgram(_program);
        cgGLEnableProfile(_profile);

        glActiveTexture(GL_TEXTURE1_ARB);
        glBindTexture(GL_TEXTURE_1D, shadetex);
        glEnable(GL_TEXTURE_1D);
        glActiveTexture(GL_TEXTURE0_ARB);
    }

    inline void end()
    {
        cgGLDisableProfile(_profile);
        glActiveTexture(GL_TEXTURE1_ARB);
        glDisable(GL_TEXTURE_1D);
        glActiveTexture(GL_TEXTURE0_ARB);
    }

    inline void drawvert(const float* normal, const float* vert, const float* texcoords)
    {
        glNormal3fv(normal);
        glTexCoord2fv(texcoords);
        glVertex3fv(vert);
    }
};
VertexProgramCellShade* VertexProgramCellShade::_instance = 0;

struct FragmentProgramCellShade
{
    static FragmentProgramCellShade* _instance;
    CGprofile _profile;
    CGcontext _context;
    CGprogram _program;

    CGparameter _shaderLightVec;
    CGparameter _shaderModelViewMat;

private:
    FragmentProgramCellShade()
    {
        _context = cgCreateContext();
        //_profile = cgGLGetLatestProfile(CG_GL_VERTEX);
        _profile = cgGLGetLatestProfile(CG_GL_FRAGMENT);
        cgGLSetOptimalOptions(_profile);
        _program = cgCreateProgramFromFile(
            _context,
            CG_SOURCE,
            "cellshade.cg",
            _profile,
            "pixelMain",
            0);

        CGerror err = cgGetError();
        if (err != CG_NO_ERROR)
        {
            printf("CG error: %s\n", cgGetErrorString(err));
            if (err = CG_COMPILER_ERROR)
                printf("%s\n", cgGetLastListing(_context));
        }

        cgGLLoadProgram(_program);

        _shaderLightVec = cgGetNamedParameter(_program, "lightVec");
        _shaderModelViewMat = cgGetNamedParameter(_program, "transformMatrix");
    }

    static void destroy() { delete _instance; }
public:

    static FragmentProgramCellShade& instance()
    {
        if (!_instance)
        {
            _instance = new FragmentProgramCellShade();
            atexit(destroy);
        }
        return *_instance;
    }

    inline void begin()
    {
        Matrix<double> m;
        glGetDoublev(GL_MODELVIEW_MATRIX, m.V);
        m.v[3][0]=m.v[3][1]=m.v[3][2]=m.v[3][3]=0;    // wipe the translation part out
        m.v[0][3]=m.v[1][3]=m.v[2][3]=m.v[3][3]=0;    // wipe the translation part out
        cgGLSetMatrixParameterdc(_shaderModelViewMat, m.V);

        cgGLSetParameter4d(_shaderLightVec, 1, 0, 1, 0); // arbitrary
        cgGLBindProgram(_program);
        cgGLEnableProfile(_profile);

        glActiveTexture(GL_TEXTURE1_ARB);
        glBindTexture(GL_TEXTURE_1D, shadetex);
        glEnable(GL_TEXTURE_1D);
        glActiveTexture(GL_TEXTURE0_ARB);
    }

    inline void end()
    {
        glColor4f(1, 1, 1, 1);
        cgGLDisableProfile(_profile);
        glActiveTexture(GL_TEXTURE1_ARB);
        glDisable(GL_TEXTURE_1D);
        glActiveTexture(GL_TEXTURE0_ARB);
    }

    inline void drawvert(const float* normal, const float* vert, const float* texcoords)
    {
        Vector<float> n(normal);
        for (int i = 0; i < 3; i++)
            n.v[i] = (n.v[i] + 1) / 2;  // compress vector into the [0-1] range

        glColor3fv(n.v);
        glTexCoord2fv(texcoords);
        glVertex3fv(vert);
    }
};
FragmentProgramCellShade* FragmentProgramCellShade::_instance = 0;

// uses a vertex shader to draw an outline.
struct VertexOutline
{
    static VertexOutline* _instance;
    CGprofile _profile;
    CGcontext _context;
    CGprogram _program;

private:
    VertexOutline()
    {
        _context = cgCreateContext();
        _profile = cgGLGetLatestProfile(CG_GL_VERTEX);
        //_profile = cgGLGetLatestProfile(CG_GL_FRAGMENT);
        cgGLSetOptimalOptions(_profile);
        _program = cgCreateProgramFromFile(
            _context,
            CG_SOURCE,
            "outline.cg",
            _profile,
            "main",
            0);

        CGerror err = cgGetError();
        if (err != CG_NO_ERROR)
        {
            printf("CG error: %s\n", cgGetErrorString(err));
            if (err = CG_COMPILER_ERROR)
                printf("%s\n", cgGetLastListing(_context));
        }

        cgGLLoadProgram(_program);
    }

    static void destroy() { delete _instance; }
public:

    static VertexOutline& instance()
    {
        if (!_instance)
        {
            _instance = new VertexOutline();
            atexit(destroy);
        }
        return *_instance;
    }

    inline void begin()
    {
        glPushAttrib(GL_ENABLE_BIT);
        glDisable(GL_TEXTURE_1D);
        glDisable(GL_TEXTURE_2D);
        glDisable(GL_LIGHTING);
        glEnable(GL_CULL_FACE);
        //glCullFace(GL_FRONT);
        glShadeModel(GL_FLAT);
        glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
        glDepthFunc(GL_LEQUAL);
        glEnable(GL_DEPTH_TEST);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        //glEnable(GL_ALPHA_TEST);
        //glAlphaFunc(GL_GEQUAL, 0.5);

        cgGLBindProgram(_program);
        cgGLEnableProfile(_profile);
    }

    inline void end()
    {
        cgGLDisableProfile(_profile);
        glPopAttrib();
        glCullFace(GL_BACK);
        glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    }

    inline void drawvert(const float* normal, const float* vert, const float*)
    {
        glNormal3fv(normal);
        glVertex3fv(vert);
    }
};
VertexOutline* VertexOutline::_instance;

/*// I cannot fathom why, but this is actually slower than immediate mode! --andy
void RenderMesh()
{
    Matrix<float> curmat;

    glEnableClientState(GL_VERTEX_ARRAY);

    CalRenderer* r=model.GetModel().getRenderer();
    r->beginRendering();

    if (cellshade)
    {
        glGetFloatv(GL_MODELVIEW_MATRIX,curmat.V);
        curmat.v[3][0]=curmat.v[3][1]=curmat.v[3][2]=0;    // wipe the translation part out
        glDisable(GL_LIGHTING);
    }
    else
        glEnable(GL_LIGHTING);

    int nMeshes=r->getMeshCount();
    for (int curmesh=0; curmesh<nMeshes; curmesh++)
    {
        int nSubs=r->getSubmeshCount(curmesh);

        for (int cursub=0; cursub<nSubs; cursub++)
        {
            r->selectMeshSubmesh(curmesh,cursub);

            static float verts[30000][3];
            int nVerts=r->getVertices(&verts[0][0]);
            glVertexPointer(3,GL_FLOAT,0,&verts[0][0]);

            static float normals[30000][3];
            int nNormals=r->getNormals(&normals[0][0]);
            if (!cellshade)
            {
                glEnableClientState(GL_NORMAL_ARRAY);
                glNormalPointer(GL_FLOAT,0,&normals[0][0]);
            }

            if (r->getMapCount())
            {
                static float texcoords[30000][2];
                int nTexcoords=r->getTextureCoordinates(0,&texcoords[0][0]);

                int hTex=(GLuint)r->getMapUserData(0);
                glEnableClientState(GL_TEXTURE_COORD_ARRAY);
                glClientActiveTexture(GL_TEXTURE0_ARB);
                glActiveTexture(GL_TEXTURE0_ARB);
                glBindTexture(GL_TEXTURE_2D,hTex);
                glTexCoordPointer(2,GL_FLOAT,0,&texcoords[0][0]);
            }

            if (cellshade)
            {
                // This should be WAY faster than the old way. @_@

                static float texcoords2[30000];
                for (int i=0; i<nVerts; i++)
                {
                    Vector<float> v(curmat*Vector<float>(normals[i]));
                    float l=v.Dot(lightvec);
                    if (l<0) l=0;
                    texcoords2[i]=l;
                }

                glClientActiveTexture(GL_TEXTURE1_ARB);
                glActiveTexture(GL_TEXTURE1_ARB);
                glEnable(GL_TEXTURE_1D);
                glEnableClientState(GL_TEXTURE_COORD_ARRAY);
                glBindTexture(GL_TEXTURE_1D,shadetex);
                glTexCoordPointer(1,GL_FLOAT,0,texcoords2);
            }

            static int faces[50000][3];
            int nFaces=r->getFaces(&faces[0][0]);

            glDrawElements(GL_TRIANGLES,nFaces*3,GL_UNSIGNED_INT,&faces[0][0]);

            if (cellshade)
            {
                glDisable(GL_TEXTURE_1D);
                glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            }
            else
                glDisableClientState(GL_NORMAL_ARRAY);
            if (r->getMapCount())
                glDisableClientState(GL_TEXTURE_COORD_ARRAY);
        }
    }

    r->endRendering();

    glDisableClientState(GL_VERTEX_ARRAY);
}*/

template <class T>
void RenderMesh(T shader)
{
    CalRenderer* r=model.GetModel().getRenderer();
    r->beginRendering();

    shader.begin();

    int nMeshes=r->getMeshCount();
    for (int curmesh=0; curmesh<nMeshes; curmesh++)
    {
        int nSubs=r->getSubmeshCount(curmesh);

        for (int cursub=0; cursub<nSubs; cursub++)
        {
            r->selectMeshSubmesh(curmesh,cursub);

            static float verts[30000][3];
            int nVerts=r->getVertices(&verts[0][0]);

            static float normals[30000][3];
            int nNormals=r->getNormals(&normals[0][0]);

            static float texcoords[30000][2];
            int nTexcoords=r->getTextureCoordinates(0,&texcoords[0][0]);

            if (r->getMapCount() && nTexcoords>0)
            {
                int hTex=(GLuint)r->getMapUserData(0);
                glBindTexture(GL_TEXTURE_2D,hTex);
            }

            static int faces[50000][3];
            int nFaces=r->getFaces(&faces[0][0]);

            glBegin(GL_TRIANGLES);
            for (int f=0; f<nFaces; f++)
            {
                for (int i=0; i<3; i++)
                {
                    int n=faces[f][i];
                    shader.drawvert(normals[n],verts[n], texcoords[n]);
                }
            }

            glEnd();

            glBindTexture(GL_TEXTURE_2D,0);
        }
    }

    shader.end();

    r->endRendering();
}

void RenderOutline()
{
    /*
     * This is far, far too slow, and I'm not entirely sure why.
     * A quick jaunt to the opengl.org forums netted me a post on
     * exactly this; GL_LINE is inordinately slow on some hardware.
     */
    glPushAttrib(GL_ENABLE_BIT);
    glDisable(GL_TEXTURE_1D);
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glCullFace(GL_FRONT);
    glPolygonMode(GL_FRONT_AND_BACK,GL_LINE);
    glDepthFunc(GL_LEQUAL);
    glColor3f(0,0,0);
    //glDisable(GL_CULL_FACE);

    RenderMesh(NoShade());

    glColor3f(1,1,1);
    glDepthFunc(GL_LESS);
    glPolygonMode(GL_FRONT_AND_BACK,GL_FILL);
    glCullFace(GL_BACK);
    glPopAttrib();
}

int colour=0;
void RenderTriList()
{
    //glEnable(GL_TEXTURE_2D);
    //glEnable(GL_LIGHTING);
    glPushAttrib(GL_ENABLE_BIT);
    glDisable(GL_TEXTURE_1D);
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
 
    CalRenderer* r=model.GetModel().getRenderer();
    r->beginRendering();

    //glEnableClientState(GL_VERTEX_ARRAY);
    //glEnableClientState(GL_NORMAL_ARRAY);
    //glEnableClientState(GL_TEXTURE_COORD_ARRAY);

    const float colours[] =
    {
        0,0,0,
        1,1,1,
        1,0,0,
        0,1,0,
        0,0,1,
        0,1,1,
        1,0,1,
        1,1,0
    };
    const int nColours = 8;
    

    for (unsigned int sub=0; sub<trilists.size(); sub++)
    {
        //unsigned int sub = 1;
        static float verts[30000][3];
        static float normals[30000][3];
        static float texcoords[30000][3];

        r->selectMeshSubmesh(0,sub);

        int nVerts     = r->getVertices(&verts[0][0]);
        //int nNormals   = r->getNormals(&normals[0][0]);
        //int nTexcoords = r->getTextureCoordinates(0,&texcoords[0][0]);

        //glVertexPointer(3,GL_FLOAT,0,&verts[0][0]);
        //glNormalPointer(GL_FLOAT,0,&normals[0][0]);
        //glTexCoordPointer(2,GL_FLOAT,0,&texcoords[0][0]);

        //glBindTexture(GL_TEXTURE_2D,(GLuint)r->getMapUserData(0));

        TriList& list=trilists[sub];

        for (unsigned int i=0; i<list.size(); i++)
        {
            colour= (colour+1)&7;
            glColor3fv(colours+colour*3);
            glBegin(GL_TRIANGLE_STRIP);
            for (unsigned int v=0; v<list[i].size(); v++)
            {
                int vert = list[i][v];
                glVertex3fv(&verts[vert][0]);
            }
            glEnd();
        }
    }

    //glDisableClientState(GL_VERTEX_ARRAY);
    //glDisableClientState(GL_NORMAL_ARRAY);
    //glDisableClientState(GL_TEXTURE_COORD_ARRAY);

    r->endRendering();

    glPopAttrib();
}

void Render()
{
    glLoadIdentity();
    glTranslatef(camera.x,camera.y,camera.z);
    glRotatef(camera.rx,0,1,0);
    glRotatef(camera.ry,1,0,0);
    glRotatef(camera.rz,0,0,1);
    //glScalef(0.1f, 0.1f, 0.1f);
    //glCullFace(GL_FRONT);

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    /*if (usetrilist)
    {
        colour=0;
        glDisable(GL_CULL_FACE);
        RenderTriList();
        glEnable(GL_CULL_FACE);
        glCullFace(GL_FRONT);
        //RenderOutline();
    }
    else if (usevertexarrays)
        RenderMesh();
    else*/
    {
        switch (shadeMode)
        {
        case sm_none:       RenderMesh(NoShade());                              break;
        case sm_normal:     RenderMesh(GLShade());                              break;
        case sm_software:   RenderMesh(CellShade());                            break;
        case sm_vertex:     RenderMesh(VertexProgramCellShade::instance());     break;
        case sm_fragment:   RenderMesh(FragmentProgramCellShade::instance());   break;
        case sm_outline:    RenderMesh(VertexOutline::instance());              break;
        }
    }
    if (outline)
        RenderMesh(VertexOutline::instance());
//        RenderOutline();

    SDL_GL_SwapBuffers();
}