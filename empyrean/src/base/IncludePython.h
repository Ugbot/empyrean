#ifndef PYR_INCLUDE_PYTHON_H
#define PYR_INCLUDE_PYTHON_H


#include "RefPtr.h"
#include "ScopedPtr.h"


// Both NSPR and Python #define HAVE_LONG_LONG without checking to see
// if it's already defined.  :P

// Also, we shouldn't include <Python.h> directly because it checks the
// _DEBUG and links with the debug version of Python (which isn't included
// in the standard distribution).  Boost.Python works around this, so we
// include that instead.


#ifdef HAVE_LONG_LONG
 #undef HAVE_LONG_LONG
 #define PYR_HAVE_LONG_LONG
#endif

#ifdef _POSIX_C_SOURCE
 #undef _POSIX_C_SOURCE
 #define PYR__POSIX_C_SOURCE
#endif

#include <boost/python.hpp>

#if defined(PYR_HAVE_LONG_LONG) && !defined(HAVE_LONG_LONG)
 #define HAVE_LONG_LONG
#endif

#if defined(PYR__POSIX_C_SOURCE) && !defined(_POSIX_C_SOURCE)
 #define _POSIX_C_SOURCE
#endif


namespace pyr {

    /**
     * @{
     * I can't figure out how to make Boost.Python accept a pyr::RefPtr or
     * pyr::ScopedPtr, so make a pyr::ptr that does what we need.
     */

    template<typename T>
    inline boost::python::pointer_wrapper<T*> ptr(const pyr::RefPtr<T>& p) {
        return boost::python::ptr(p.raw_ptr());
    }

    template<typename T>
    inline boost::python::pointer_wrapper<T*> ptr(const pyr::ScopedPtr<T>& p) {
        return boost::python::ptr(p.raw_ptr());
    }

    /// @}

}


#endif
