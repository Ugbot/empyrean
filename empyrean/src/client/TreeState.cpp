#include "File.h"
#include "GLUtility.h"
#include "ScopedArray.h"
#include "ScopedPtr.h"
#include "TreeState.h"


namespace pyr {

    class MenuState;

    PYR_REGISTER_STATE_FACTORY(TreeState)

    TreeState::TreeState() {
        _program = glCreateProgramObjectARB();
        if (!_program) {
            throw std::runtime_error("glCreateProgramObjectARB failed.");
        }

        _vertexShader = glCreateShaderObjectARB(GL_VERTEX_SHADER_ARB);
        if (!_vertexShader) {
            glDeleteObjectARB(_program);
            throw std::runtime_error("glCreateShaderObjectARB(GL_VERTEX_SHADER_ARB) failed.");
        }

        loadShader(_vertexShader, "shaders/wind.vs");

        glAttachObjectARB(_program, _vertexShader);
        glLinkProgramARB(_program);

        GLint linked;
        glGetObjectParameterivARB(_program, GL_OBJECT_LINK_STATUS_ARB, &linked);
        if (!linked) {
            GLint length;
            glGetObjectParameterivARB(_program, GL_OBJECT_INFO_LOG_LENGTH_ARB, &length);
            ScopedArray<GLcharARB> infoLog(new GLcharARB[length]);
            glGetInfoLogARB(_program, length, 0, infoLog.get());
            throw std::runtime_error(string("GLSL Link error: ") + infoLog.get());
        }

        _weightIndex = glGetAttribLocationARB(_program, "weight");
        _vxIndex     = glGetAttribLocationARB(_program, "vx");

        checkOpenGLErrors();

        Matrix44f matrix;
        drawBranch(matrix);
    }

    TreeState::~TreeState() {
        glDeleteObjectARB(_vertexShader);
        glDeleteObjectARB(_program);
    }

    void TreeState::draw() {
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(-4, 4, -1, 5, 10, -10);

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        glEnable(GL_LINE_SMOOTH);
        glEnable(GL_DEPTH_TEST);

        float waveApex[] = {
            fmod(4 * _time * 1.01f, 40.0f) - 20,
            fmod(4 * _time * 1.99f, 40.0f) - 20,
            fmod(4 * _time * 1.33f, 40.0f) - 20,
            fmod(4 * _time * 1.77f, 40.0f) - 20,
        };

        glUseProgramObjectARB(_program);
        glUniform4fvARB(glGetUniformLocationARB(_program, "waveApexes"), 1, waveApex);

        float eps = 0.0001f;

        glRotatef(_time, 0, 1, 0);

        Vec3f brown(0.419f, 0.098f, 0.030f);
        Vec3f green(0.125f, 0.682f, 0.098f);

        for (size_t i = 0; i < _lines.size(); ++i) {
            Line& line = _lines[i];

            glLineWidth(line.width);
            glBegin(GL_LINES);
                glColor(green * line.w1 + brown * (1 - line.w1));
                if (_weightIndex != -1) {
                    glVertexAttrib1fARB(_weightIndex, line.w1);
                }
                if (_vxIndex != -1) {
                    glVertexAttrib1fARB(_vxIndex, line.v1[0] + line.v2[2]);
                }
                glVertex(line.v1);

                glColor(green * line.w2 + brown * (1 - line.w2));
                if (_weightIndex != -1) {
                    glVertexAttrib1fARB(_weightIndex, line.w2);
                }
                if (_vxIndex != -1) {
                    glVertexAttrib1fARB(_vxIndex, line.v2[0] + line.v2[2]);
                }
                glVertex(line.v2);
            glEnd();

        }
        
        glColor3f(1, 1, 1);


        glUseProgramObjectARB(0);

        glDisable(GL_LINE_SMOOTH);
        glDisable(GL_DEPTH_TEST);
    }

    void TreeState::update(float dt) {
        _time += dt;
    }

    void TreeState::onKeyPress(SDLKey key, bool down) {
        if (down && key == SDLK_ESCAPE) {
            quit();
        }
    }

    void TreeState::drawBranch(Matrix44f matrix, int depth) {
        if (depth == 0) {
            return;
        }

        Line line;
        
        float a = float(MAX_DEPTH - depth) / MAX_DEPTH;
        line.w1 = a * a;
        float b = float(MAX_DEPTH - (depth - 1)) / MAX_DEPTH;
        line.w2 = b * b;

        line.width = float(depth);

        line.v1 = matrix * gmtl::Point3f(0, 0, 0);
        line.v2 = matrix * gmtl::Point3f(0, 1, 0);

        _lines.push_back(line);

        Matrix44f m1;
        setTrans(m1, Vec4f(0, 1, 0, 1));
        setRot(m1, gmtl::AxisAnglef(gmtl::Math::deg2Rad(30.0f), Vec3f(-1, 0, 0)));
        m1(0, 0) *= 0.7f;
        m1(1, 1) *= 0.7f;
        m1(2, 2) *= 0.7f;
        drawBranch(m1 * matrix, depth - 1);

        Matrix44f m2;
        setTrans(m2, Vec4f(0, 1, 0, 1));
        setRot(m2, gmtl::AxisAnglef(gmtl::Math::deg2Rad(27.0f), normal(Vec3f(0.7f, 0, -1))));
        m2(0, 0) *= 0.7f;
        m2(1, 1) *= 0.7f;
        m2(2, 2) *= 0.7f;
        drawBranch(m2 * matrix, depth - 1);

        Matrix44f m3;
        setTrans(m3, Vec4f(0, 1, 0, 1));
        setRot(m3, gmtl::AxisAnglef(gmtl::Math::deg2Rad(29.0f), normal(Vec3f(0.7f, 0, 1))));
        m3(0, 0) *= 0.7f;
        m3(1, 1) *= 0.7f;
        m3(2, 2) *= 0.7f;
        drawBranch(m3 * matrix, depth - 1);

    }

}
