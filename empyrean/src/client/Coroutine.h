#ifndef PYR_COROUTINE_H
#define PYR_COROUTINE_H

/*

    This stuff is based on Simon Tatham's code.  In fact, it pretty much *IS* his stuff.
    http://www.chiark.greenend.org.uk/~sgtatham/coroutines.html  Happy URL which explains everything.

    My teeny tiny contribution to his neat coroutine stuff is simply the idea that one can use
    C++ and make the coroutine function into a functor, and thus make it threadsafe, and some
    other nice side effects.

    EXAMPLE:

    struct Loop
    {
        crDeclareState()
        int i;

        Loop() : i(0)    {        crInit()    }

        int operator ()()
        {
            crBegin()

            for (i=0; i<10; i++)
                crReturn(i);

            crFinish()

            return 0;
        }
    };

    void main()
    {
        Loop loop;

        cout << loop << endl;
        cout << loop << endl;
        cout << loop << endl;
        cout << loop << endl;
    }

    Neat, huh. :D
*/


#define crDeclareState() int _state;
#define crInit()         _state=0;
#define crBegin()        switch(_state) { case 0:
#define crReturn(x)      do { _state=__LINE__; return x; case __LINE__:; } while (0)
#define crReturnVoid()   do { _state=__LINE__; return  ; case __LINE__:; } while (0)
#define crFinish()       }

#endif