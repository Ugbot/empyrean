#ifndef PYR_INCLUDE_PYTHON_H
#define PYR_INCLUDE_PYTHON_H


// Both NSPR and Python #define HAVE_LONG_LONG without checking to see
// if it's already defined.  :P


#ifdef HAVE_LONG_LONG
 #undef HAVE_LONG_LONG
 #include <boost/python.hpp>
 #ifndef HAVE_LONG_LONG
  #define HAVE_LONG_LONG
 #endif
#else
 #include <boost/python.hpp>
#endif


#endif
