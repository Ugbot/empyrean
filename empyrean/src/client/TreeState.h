#ifndef PYR_TREE_STATE_H
#define PYR_TREE_STATE_H


#include "OpenGL.h"
#include "State.h"


namespace pyr {

    class Texture;

    class TreeState : public State {
    public:
        TreeState();
        ~TreeState();

	const char* getName() const {
            return "TreeState";
	}
        
        void draw();
        void update(float dt);

        void onKeyPress(SDLKey key, bool down);
        
    private:
        static const int MAX_DEPTH = 7;
        void drawBranch(Matrix44f matrix, int depth = MAX_DEPTH);

        Zeroed<float> _time;
        GLhandleARB _program;
        GLhandleARB _vertexShader;

        GLint _weightIndex;
        GLint _vxIndex;

        struct Line {
            float width;
            Vec3f v1;
            Vec3f v2;
            float w1;
            float w2;
        };
        std::vector<Line> _lines;
    };
    
}


#endif
