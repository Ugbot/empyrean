#ifndef PYR_INCLUDE_NSPR_H
#define PYR_INCLUDE_NSPR_H


// Both NSPR and Python #define HAVE_LONG_LONG without checking to see
// if it's already defined.  :P

#ifdef HAVE_LONG_LONG
 #undef HAVE_LONG_LONG
 #define PYR_HAVE_LONG_LONG
#endif

#include <pratom.h>
#include <prinrval.h>
#include <prlock.h>
#include <prnetdb.h>
#include <prthread.h>
#include <prtypes.h>

#if defined(PYR_HAVE_LONG_LONG) && !defined(HAVE_LONG_LONG)
 #define HAVE_LONG_LONG
#endif


#endif
