#ifndef INCLUDED_LISTENER_H
#define INCLUDED_LISTENER_H

template <class Callback>
class Listener {
public:
    Callback &operator*() { return Callback(); };
};

#endif
