#ifndef PYR_FPS_COUNTER_H
#define PYR_FPS_COUNTER_H


#include "Utility.h"


namespace pyr {

    class FPSCounter {
    public:
        void update(float dt) {
            _elapsedTime += dt;
            ++_frameCount;
            if (_elapsedTime > 1.0f) {
                _fps = _frameCount;
                _frameCount = 0;
                _elapsedTime -= 1.0f;
            }
        }
        
        int getFPS() {
            return _fps;
        }
        
    private:
        Zeroed<int> _fps;
        Zeroed<int> _frameCount;
        Zeroed<float> _elapsedTime;
    };

}


#endif
