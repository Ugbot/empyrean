#include <stdexcept>
#include "Debug.h"
#include "File.h"
#include "GLUtility.h"
#include "ScopedPtr.h"
#include "ScopedArray.h"

namespace pyr {

    static const float NEG_PLANE = -2000;
    static const float POS_PLANE  = 2000;

    void setOrthoProjection(float width, float height, bool cartesian) {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        if (cartesian) {
            glOrtho(0, width, 0, height, NEG_PLANE, POS_PLANE);
        } else {
            glOrtho(0, width, height, 0, NEG_PLANE, POS_PLANE);
        }
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
    }

    const char* getErrorString(GLenum error) {
        switch (error) {
            case GL_INVALID_ENUM:      return "GL_INVALID_ENUM";
            case GL_INVALID_VALUE:     return "GL_INVALID_VALUE";
            case GL_INVALID_OPERATION: return "GL_INVALID_OPERATION";
            case GL_STACK_OVERFLOW:    return "GL_STACK_OVERFLOW";
            case GL_STACK_UNDERFLOW:   return "GL_STACK_UNDERFLOW";
            case GL_OUT_OF_MEMORY:     return "GL_OUT_OF_MEMORY";
            case GL_TABLE_TOO_LARGE:   return "GL_TABLE_TOO_LARGE";
            default:                   return "Unknown error";
        }
    }

    void checkOpenGLErrors() {
        GLenum error;
	while ((error = glGetError()) != GL_NO_ERROR) {
            PYR_BREAK();
            throw std::runtime_error(getErrorString(error));
        }
    }

    void loadShader(GLhandleARB shader, const char* filename) {
        ScopedPtr<File> file(openFile(filename));
        u32 length = static_cast<u32>(file->getLength());
        ScopedArray<GLcharARB> source = new GLcharARB[length];
        size_t read = file->read(source.get(), length);
        if (read != length) {
            throw std::runtime_error("read != length in shader read");
        }

        const GLcharARB* sources[] = { source.get() };
        GLint            lengths[] = { length };
        glShaderSourceARB(shader, 1, sources, lengths);

        glCompileShaderARB(shader);
        GLint compiled;
        glGetObjectParameterivARB(shader, GL_OBJECT_COMPILE_STATUS_ARB, &compiled);
        if (!compiled) {
            GLint length;
            glGetObjectParameterivARB(shader, GL_OBJECT_INFO_LOG_LENGTH_ARB, &length);
            ScopedArray<GLcharARB> infoLog(new GLcharARB[length]);
            glGetInfoLogARB(shader, length, 0, infoLog.get());
            throw std::runtime_error(string("GLSL Compile error: ") + infoLog.get());
        }

        checkOpenGLErrors();
    }

}
