#ifndef PYR_LOCK_H
#define PYR_LOCK_H


namespace pyr {

    class Lock {
    public:
        virtual void lock() = 0;
        virtual void unlock() = 0;
    };

}


#endif
