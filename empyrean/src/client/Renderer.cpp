#include <exception>

#include <SDL_opengl.h>
#include <SDL_video.h> // SDL_GL_GetProcAddress
#include <cal3d/cal3d.h>
#include <gmtl/Vec.h>
#include <gmtl/Matrix.h>
#include <gmtl/VecOps.h>
#include <gmtl/Xforms.h>

#include "Renderer.h"
#include "Model.h"
#include "Texture.h"
#include "Types.h"
#include "Debug.h"
#include "Profiler.h"

namespace {
    using namespace pyr;

    PFNGLACTIVETEXTUREARBPROC glActiveTextureARB=0;
    PFNGLMULTITEXCOORD1FARBPROC glMultiTexCoord1fARB=0;

    /*
     * I like this algorithm a lot more, as it's much cleaner and more flexible.
     * Sadly, it's also quite a bit slower than the other method.
     * It's still here for reference, basically.
     */
    void renderMesh(Model& model) {

        glEnableClientState(GL_VERTEX_ARRAY);
        glEnableClientState(GL_NORMAL_ARRAY);
        glDisable(GL_TEXTURE_2D);
        glDisable(GL_BLEND);
        glColor3f(1, 1, 1);

        CalRenderer* r=model.getModel().getRenderer();
        r->beginRendering();

        static float ambient[]=  { 0.5f, 0.5f, 0.5f, 1.0f };
        static float diffuse[]=  { 1, 1, 1, 1 };
        static float light[]= { 0, 20, 10 };

        glLightfv(GL_LIGHT1, GL_AMBIENT, ambient);
        glLightfv(GL_LIGHT1, GL_DIFFUSE, diffuse);
        glLightfv(GL_LIGHT1, GL_POSITION, light);
        glEnable(GL_LIGHT1);        glEnable(GL_LIGHTING);

        int nMeshes=r->getMeshCount();
        for (int curmesh=0; curmesh<nMeshes; curmesh++)
        {
            int nSubs=r->getSubmeshCount(curmesh);

            for (int cursub=0; cursub < nSubs; cursub++)
            {
                r->selectMeshSubmesh(curmesh, cursub);

                static float verts[30000][3];
                int nVerts=r->getVertices(&verts[0][0]);
                glVertexPointer(3, GL_FLOAT, 0, &verts[0][0]);

                static float normals[30000][3];
                int nNormals=r->getNormals(&normals[0][0]);
                glEnableClientState(GL_NORMAL_ARRAY);
                glNormalPointer(GL_FLOAT, 0, &normals[0][0]);

                if (r->getMapCount()) {
                    static float texcoords[30000][2];
                    int nTexcoords=r->getTextureCoordinates(0, &texcoords[0][0]);
                    glEnable(GL_TEXTURE_2D);
                    glBindTexture(GL_TEXTURE_2D, (GLuint)r->getMapUserData(0));
                    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
                    glTexCoordPointer(2, GL_FLOAT, 0, &texcoords[0][0]);
                }                

                static int faces[50000][3];
                int nFaces=r->getFaces(&faces[0][0]);

                glDrawElements(GL_TRIANGLES, nFaces*3, GL_UNSIGNED_INT, &faces[0][0]);
            }
        }

        r->endRendering();

        glDisableClientState(GL_VERTEX_ARRAY);
        glDisableClientState(GL_NORMAL_ARRAY);
        glDisable(GL_LIGHTING);
    }

    /** Main model rendering function
     *
     * The ideal to shoot for is to have this function completely bereft of OpenGL calls.
     * Everything should be handled by the Shader passed in, so as to allow Direct3D to
     * be dropped in easily.  Almost there.
     *
     * Shader needs to have the following:
     * void begin() -- called before rendering the mesh begins
     * void end()   -- called when the mesh is completely rendered
     * void drawVert(float* verts,float* normals,float* texcoords) -- called to render a single vertex
     * void setTexture(Texture* tex) -- sets the texture to be used henceforth
     */
    template <class Shader>
    void renderMesh(Model& model,Shader shader) {
        PYR_PROFILE_BLOCK("renderMesh");

        CalRenderer& r=*model.getModel().getRenderer();
        
        r.beginRendering();
        shader.begin();

        int nMeshes=r.getMeshCount();
        for (int curmesh=0; curmesh<nMeshes; curmesh++) {
            int nSubs=r.getSubmeshCount(curmesh);

            for (int cursub=0; cursub<nSubs; cursub++) {
                r.selectMeshSubmesh(curmesh,cursub);

                static float verts[30000][3];
                int nVerts=r.getVertices(&verts[0][0]);

                static float normals[30000][3];
                int nNormals=r.getNormals(&normals[0][0]);

                static float texcoords[30000][2];
                int nTexcoords=r.getTextureCoordinates(0,&texcoords[0][0]);

                if (r.getMapCount() && nTexcoords>0) {
                    u32 tex=(u32)r.getMapUserData(0);
                    shader.setTex(tex);
                }

                static int faces[50000][3];
                int nFaces=r.getFaces(&faces[0][0]);

                // The only OpenGL call in this function.  Abstract into the Shader when it becomes beneficial to do so.
                glBegin(GL_TRIANGLES);
                for (int f = 0; f < nFaces; f++) {
                    // Will the compiler unroll this?  Is it worth it?
                    for (int i=0; i<3; i++) {
                        int n = faces[f][i];
                        shader.drawVert(verts[n], normals[n], texcoords[n]);
                    }
                }
                glEnd();
            }
        }

        shader.end();
        r.endRendering();
    }

    //! Uses OpenGL hardware to shade the model in the traditional manner.
    struct DefaultShade {

        static const float scale;

        inline void begin() {
            static float ambient[]=  { 0.5f, 0.5f, 0.5f, 1.0f };
            static float diffuse[]=  { 1,1,1,1 };
            static float light[]= {1,0,0};

            glLightfv(GL_LIGHT1,GL_AMBIENT,ambient);
            glLightfv(GL_LIGHT1,GL_DIFFUSE,diffuse);
            glLightfv(GL_LIGHT1,GL_POSITION,light);
            glEnable(GL_LIGHT1);

            glScalef(scale,scale,scale);

            glEnable(GL_LIGHTING);
            glEnable(GL_TEXTURE_2D);
        }

        inline void end() {
            glDisable(GL_LIGHTING);
            glDisable(GL_TEXTURE_2D);

            glScalef(1/scale,1/scale,1/scale);
        }

        inline void drawVert(float* verts,float* normals,float* texcoords) {
            glTexCoord2fv(texcoords);
            glNormal3fv(normals);
            glVertex3fv(verts);
        }

        inline void setTex(u32 tex)
        {
            glBindTexture(GL_TEXTURE_2D,tex);
        }
    };

    const float DefaultShade::scale=0.01f;

    /** Cell shading algorithm outlined at http://nehe.gamedev.net/tutorials/lesson37.jpg
     *
     * Texture unit 0 is used for the actual model texture.  That hasn't changed.
     * Texture unit 1 is a 1D texture used as a lookup table by GL.
     * I think it might be faster in the long run if we have GL_TEXTURE_2D always on
     * for unit 0, and turn it off when it's not needed, as opposed to turning it on
     * when we do need it. (as is almost always the case)
     */
    struct CellShade {

        gmtl::Matrix44f _mat;
        gmtl::Vec3f _lightVec;
        GLuint _shadeTex;

        CellShade(u32 s) : _shadeTex(s) {
        }

        inline void begin() {
            
            glGetFloatv(GL_MODELVIEW_MATRIX,const_cast<float*>(_mat.getData()));
            _mat(3,0)=_mat(3,1)=_mat(3,2)=0;                 // wipe the translation part out

            _lightVec.set(0.5,0.5,1);
            gmtl::normalize(_lightVec);

            glActiveTextureARB(GL_TEXTURE1_ARB);
            glBindTexture(GL_TEXTURE_1D,_shadeTex);
            glEnable(GL_TEXTURE_1D);
            glActiveTextureARB(GL_TEXTURE0_ARB);
            glEnable(GL_TEXTURE_2D);
        }

        inline void end() {
            glActiveTextureARB(GL_TEXTURE1_ARB);
            Texture::unbind();
            glDisable(GL_TEXTURE_1D);

            glActiveTextureARB(GL_TEXTURE0_ARB);
            Texture::unbind();
            glDisable(GL_TEXTURE_2D);
        }

        inline void drawVert(float* verts,float* normals,float* texcoords) {
            gmtl::Vec3f v(_mat * gmtl::Vec3f(normals[0],normals[1],normals[2]));
            float light = gmtl::dot(v,_lightVec);

            glMultiTexCoord1fARB(GL_TEXTURE1_ARB, light);
            glTexCoord2fv(texcoords);
            glVertex3fv(verts);
        }

        inline void setTex(u32 tex)
        {
            PYR_ASSERT(tex,"CellShade::tex must not be 0!");
            glBindTexture(GL_TEXTURE_2D,tex);
        }
    };

    // there is no way I'm copy/pasting out those insane goddamn typedef names
    // Macro for stringizing.  Template function for casting nonsense.
#define PYR_GET_EXTENSION(name) assign(name, SDL_GL_GetProcAddress(#name))

    template <class T>
    void assign(T d,void* s) {
        d=(T)s;
    }

    void initExtensions() {
        PYR_GET_EXTENSION(glActiveTextureARB);
        PYR_GET_EXTENSION(glMultiTexCoord1fARB);
    }

#undef PYR_GET_EXTENSION
};

namespace pyr {

    void Renderer::begin2D() {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 4, 3, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        glDisable(GL_DEPTH_TEST);
    }

    void Renderer::end2D() {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluPerspective(45,4.0/3.0,0.1,800);

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        glEnable(GL_DEPTH_TEST);
    }

    void DefaultRenderer::draw(Model* m) {
        renderMesh(*m,DefaultShade());
        //renderMesh(m);
    }

    CellShadeRenderer::ShadeTex::ShadeTex() {
        u32 pixels[32];
        int i=0;
        while (i<1) pixels[i++]=0xFF404040;
        while (i<13) pixels[i++]=0xFF808080;
        while (i<32) pixels[i++]=0xFFFFFFFF;
        glGenTextures(1,&handle);
        glBindTexture(GL_TEXTURE_1D,handle);
        glTexImage1D(GL_TEXTURE_1D,0,GL_RGBA,32,0,GL_RGBA,GL_UNSIGNED_BYTE,pixels);
        glTexParameteri(GL_TEXTURE_1D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
        glTexParameteri(GL_TEXTURE_1D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
        glTexParameteri(GL_TEXTURE_1D,GL_TEXTURE_WRAP_R,GL_CLAMP);
    }

    CellShadeRenderer::ShadeTex::~ShadeTex() {
        glDeleteTextures(1,&handle);
    }

    CellShadeRenderer::CellShadeRenderer() {
        if (!glActiveTextureARB)
            initExtensions();
        
        if (!glActiveTextureARB)
            throw std::exception("CellShadeRenderer requires the GL_ARB_multitexture extension.");
    }

    void CellShadeRenderer::draw(Model* m) {
        renderMesh(*m,CellShade(_shadeTex.handle));
    }
};