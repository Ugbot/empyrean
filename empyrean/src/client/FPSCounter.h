#ifndef PYR_FPS_COUNTER_H
#define PYR_FPS_COUNTER_H


namespace pyr {

    class FPSCounter {
    public:
        FPSCounter() {
            _fps = 0;
            _frameCount = 0;
            _elapsedTime = 0;
            _changed = false;
        }
        
        void update(float dt) {
            _elapsedTime += dt;
            ++_frameCount;
            if (_elapsedTime > 1.0f) {
                _fps = _frameCount;
                _frameCount = 0;
                _elapsedTime -= 1.0f;
                _changed = true;
            }
        }

        bool changed() {
            return _changed;
        }
        
        int getFPS() {
            _changed = false;
            return _fps;
        }
        
    private:
        int _fps;
        int _frameCount;
        float _elapsedTime;
        bool _changed;
    };

}


#endif
