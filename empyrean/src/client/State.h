#ifndef PYR_STATE_H
#define PYR_STATE_H


namespace pyr {

    class State {
    public:
        virtual ~State() { }
        virtual void draw() { }
        virtual void update(float dt) { }
    };

}


#endif
