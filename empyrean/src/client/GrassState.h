#ifndef PYR_GRASS_STATE_H
#define PYR_GRASS_STATE_H


#include "OpenGL.h"
#include "State.h"


namespace pyr {

    class Texture;

    class GrassState : public State {
    public:
        GrassState();
        ~GrassState();

	const char* getName() const {
            return "GrassState";
	}
        
        void draw();
        void update(float dt);

        void onKeyPress(SDLKey key, bool down);
        
    private:
        Zeroed<float> _time;
        GLhandleARB _program;
        GLhandleARB _vertexShader;

        struct Blade {
            float x;
            float vx;
            float height;
        };
        std::vector<Blade> _grass;
        GLuint _vertexList;

        Inited<bool, false> _wireframe;
    };
    
}


#endif
