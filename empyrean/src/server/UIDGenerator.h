#ifndef PYR_UID_GENERATOR_H
#define PYR_UID_GENERATOR_H


#include <queue>


namespace pyr {

    template<typename UID, UID minValue = 0>
    class UIDGenerator {
    public:
        typedef std::priority_queue<
            UID,
            std::vector<UID>,
            std::greater<UID> > AvailableQueue;
            
        UIDGenerator() {
            _largest = minValue;
        }
        
        UID reserve() {
            if (_available.empty()) {
                // reserve a new ID and return it
                return _largest++;
            } else {
                // use an available ID
                UID id = _available.top();
                _available.pop();
                return id;
            }
        }
        
        void release(UID id) {
            PYR_ASSERT(id < _largest, "Trying to release unmanaged ID");
            _available.push(id);
        }
    
    private:
        UID _largest;
        AvailableQueue _available;
    };

}


#endif
