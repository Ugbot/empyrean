#ifndef PYR_INCLUDE_NSPR_H
#define PYR_INCLUDE_NSPR_H


// Both NSPR and Python #define HAVE_LONG_LONG without checking to see
// if it's already defined.  :P

#ifdef HAVE_LONG_LONG
 #undef HAVE_LONG_LONG
 #include <prtypes.h>
 #ifndef HAVE_LONG_LONG
  #define HAVE_LONG_LONG
 #endif
#else
 #include <prtypes.h>
#endif


#endif
