#include <cal3d/cal3d.h>
#include "Debug.h"
#include "Model.h"
#include "ModelRenderer.h"
#include "OpenGL.h"
#include "Profiler.h"
#include "Texture.h"
#include "Types.h"
#include "VecMath.h"

namespace pyr {

    void ModelRenderer::draw(const Model& m) {
        PYR_PROFILE_BLOCK("ModelRenderer::draw");

        glPushMatrix();
        float scale = m.getScale();
        glScalef(scale, scale, scale);
        renderMesh(m);
        glPopMatrix();
    }

    void ModelRenderer::renderMesh(const Model& model) {
        PYR_PROFILE_BLOCK("ModelRenderer::renderMesh");

        glEnableClientState(GL_VERTEX_ARRAY);
        glEnableClientState(GL_NORMAL_ARRAY);
        glEnable(GL_TEXTURE_2D);

        CalRenderer* r = model.getModel().getRenderer();
        r->beginRendering();

        //static float ambient[] = { 0.5f, 0.5f, 0.5f, 1.0f };
        //static float diffuse[] = { 1, 1, 1, 1 };
        static Vec3f lightvec(0.5, 0.5, 1);
        normalize(lightvec);

        glColor3f(1, 1, 1);

        int nMeshes = r->getMeshCount();
        for (int curmesh = 0; curmesh < nMeshes; curmesh++) {
            int nSubs = r->getSubmeshCount(curmesh);

            for (int cursub = 0; cursub < nSubs; cursub++) {
                r->selectMeshSubmesh(curmesh, cursub);

                static float verts[30000][3];
                r->getVertices(&verts[0][0]);
                glVertexPointer(3, GL_FLOAT, 0, &verts[0][0]);

                static float normals[30000][3];
                r->getNormals(&normals[0][0]);

                glEnableClientState(GL_NORMAL_ARRAY);
                glNormalPointer(GL_FLOAT, 0, &normals[0][0]);

                if (r->getMapCount()) {
                    static float texcoords[30000][2];
                    r->getTextureCoordinates(0, &texcoords[0][0]);
                    glEnable(GL_TEXTURE_2D);
                    glBindTexture(GL_TEXTURE_2D, ((CalTexture*)r->getMapUserData(0))->tex);
                    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
                    glTexCoordPointer(2, GL_FLOAT, 0, &texcoords[0][0]);
                } else {
                    glDisable(GL_TEXTURE_2D);
                }


                static int faces[50000][3];
                int nFaces=r->getFaces(&faces[0][0]);

                glDrawElements(GL_TRIANGLES, nFaces*3, GL_UNSIGNED_INT, &faces[0][0]);

            }
        }

        r->endRendering();

        glDisableClientState(GL_VERTEX_ARRAY);
        glDisableClientState(GL_NORMAL_ARRAY);
    }

}
