#ifndef PYR_CALL_STACK_H
#define PYR_CALL_STACK_H


#include <memory>
#include <string>
#include "Error.h"
#include "ScopedPtr.h"


namespace pyr {

    PYR_DEFINE_RUNTIME_ERROR(CallStackError);

    class CallStack {
    public:
        static bool isSupported();

        CallStack();
        CallStack(const CallStack& rhs);
        ~CallStack();
        
        CallStack& operator=(const CallStack& rhs);
        
        std::string asString() const;
        
    private:
        struct Impl;
        ScopedPtr<Impl> _impl;
    };

}
    

#endif
