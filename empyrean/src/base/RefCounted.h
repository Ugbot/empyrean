#ifndef PYR_REF_COUNTED_H
#define PYR_REF_COUNTED_H


#include "Debug.h"
#include "Utility.h"


namespace pyr {
    
    template <typename T> class RefPtr;
    
    /**
     * Derive from RefCounted to make your class have reference-counted
     * lifetime semantics.  Use RefPtr to manage references.  (Don't call
     * ref() or unref() directly.)
     *
     * Note:  The reference count is initialized to 0.  This makes sense,
     * because, at object construction, no RefPtrs have referenced the
     * object.  However, this can cause trouble if you (indirectly) make
     * a RefPtr to 'this' within your constructor.  When the refptr goes
     * out of scope, the count goes back to 0, and the object is deleted
     * before it even exits the constructor.  Current recommended solution:  
     * Don't make refptrs to this.  Pass 'this' by raw pointer and such.
     */
    class RefCounted {
        template<typename T> friend class RefPtr;
        
    protected:
        RefCounted() {
        }

        /**
         * Protected so users of refcounted classes don't use std::auto_ptr
         * or the delete operator.
         *
         * Interfaces that derive from RefCounted should define an inline,
         * empty, protected destructor as well.
         */
        virtual ~RefCounted() {
            PYR_ASSERT(_refCount == 0, "_refCount nonzero in destructor");
        }
        
    private:
        /**
         * Add a reference to the internal reference count.
         */
        void ref() {
            ++_refCount;
        }

        /**
         * Remove a reference from the internal reference count.  When this
         * reaches 0, the object is destroyed.
         */
        void unref() {
            PYR_ASSERT(_refCount > 0, "_refCount is less than zero in unref()!");

            if (--_refCount == 0) {
                delete this;
            }
        }
        
    private:
        Zeroed<int> _refCount;
    };

}


#endif
