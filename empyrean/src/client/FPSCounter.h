#ifndef PYR_FPS_COUNTER_H
#define PYR_FPS_COUNTER_H


namespace pyr {

    class FPSCounter {
    public:
        FPSCounter() {
            _fps = 0;
            _frameCount = 0;
            _elapsedTime = 0;
        }
        
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
        int _fps;
        int _frameCount;
        float _elapsedTime;
    };

}


#endif
