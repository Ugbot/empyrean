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
    
        float getValue() {
            return _value;
        }
        
        void setValue(float value) {
            _value = value;
        }
        
        float getDelta() {
            if (_lastInterval == 0) {
                return 0;
            } else {
                return (_value - _lastValue) / _lastInterval;
            }
        }
        
    private:
        float _value;
        float _lastValue;
        float _lastInterval;
    };

}


#endif
