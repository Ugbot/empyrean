#ifndef PYR_INPUT_H
#define PYR_INPUT_H


namespace pyr {

    class Input {
    public:
        Input() {
            _value = 0;
            _lastValue = 0;
            _lastInterval = 0;
        }
    
        void update(float dt) {
            _lastValue = _value;
            _lastInterval = dt;
        }
    
        float getValue() const {
            return _value;
        }
        
        void setValue(float value) {
            _value = value;
        }
        
        float getDelta() const {
            if (_lastInterval == 0) {
                return 0;
            } else {
                return getRawDelta() / _lastInterval;
            }
        }
        
        float getRawDelta() const {
            return _value - _lastValue;
        }
        
    private:
        float _value;
        float _lastValue;
        float _lastInterval;
    };

}


#endif
