#include "File.h"
#include "GLUtility.h"
#include "ScopedArray.h"
#include "ScopedPtr.h"
#include "GrassState.h"


namespace pyr {

    class MenuState;

    PYR_REGISTER_STATE_FACTORY(GrassState)

    GrassState::GrassState() {
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

        checkOpenGLErrors();


        for (size_t i = 0; i < 500; ++i) {
            Blade b;
            b.x  = randf() * 10 - 5;
            b.vx = randf() * 10 - 5;
            b.height = randf() + 1;
            _grass.push_back(b);
        }
    }

    GrassState::~GrassState() {
        glDeleteObjectARB(_vertexShader);
        glDeleteObjectARB(_program);
    }

    void GrassState::draw() {
        glClear(GL_COLOR_BUFFER_BIT);

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(-5, 5, -2, 4, 10, -10);

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST);
        glEnable(GL_POLYGON_SMOOTH);
        if (_wireframe) {
            glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
        }

        float waveApex[] = {
            fmod(4 * _time * 1.01f, 40.0f) - 20,
            fmod(4 * _time * 1.99f, 40.0f) - 20,
            fmod(4 * _time * 1.33f, 40.0f) - 20,
            fmod(4 * _time * 1.77f, 40.0f) - 20,
        };

        glUseProgramObjectARB(_program);
        glUniform4fvARB(glGetUniformLocationARB(_program, "waveApexes"), 1, waveApex);

        float eps = 0.0001f;
        const float width = 0.1f;

        GLint weightIndex = glGetAttribLocationARB(_program, "weight");
        GLint vxIndex     = glGetAttribLocationARB(_program, "vx");
        //PYR_ASSERT(weightIndex != -1, "Weight attribute non-existent.");

        for (size_t i = 0; i < _grass.size(); ++i) {
            float f = _grass[i].x;
            float vx = _grass[i].vx;
            float height = _grass[i].height;
            if (vxIndex != -1) {
                glVertexAttrib1fARB(vxIndex, vx);
            }

            glBegin(GL_TRIANGLE_STRIP);
            for (float h = 0; h < height - eps; h += height / 10) {
                if (weightIndex != -1) {
                    glVertexAttrib1fARB(weightIndex, h / height);
                }
                glColor3f(0, 0.6f, 0);
                glVertex2f(f - width / 2 * (height - h), h);
                glColor3f(0, 0.2f, 0);
                glVertex2f(f + width / 2 * (height - h), h);
            }
            if (weightIndex != -1) {
                glVertexAttrib1fARB(weightIndex, 1);
            }
            glVertex2f(f, height);
            glEnd();
        }

        glUseProgramObjectARB(0);

        if (_wireframe) {
            glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        }
        glDisable(GL_POLYGON_SMOOTH);
        glColor3f(1, 1, 1);
    }

    void GrassState::update(float dt) {
        _time += dt;
#if 0
        if (_time * 10 > _grass.size()) {
            Blade b;
            b.x  = randf() * 10 - 5;
            b.vx = randf() * 10 - 5;
            b.height = randf() + 1;
            _grass.push_back(b);
        }
#endif
    }

    void GrassState::onKeyPress(SDLKey key, bool down) {
        if (down && key == SDLK_ESCAPE) {
            quit();
        }

        if (down && key == SDLK_w) {
            _wireframe = !_wireframe;
        }
    }
    
}
