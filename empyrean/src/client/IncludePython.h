#ifndef PYR_INCLUDE_PYTHON_H
#define PYR_INCLUDE_PYTHON_H


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


#endif
