#!/bin/sh

CVSROOT=`cat CVS/Root`

# Checkout the resources from the repository.  Put them in a temporary
# directory so running CVS from this directory doesn't see the
# resources directory and think it should look in there.  (Having files
# from two different repositories in one tree sometimes gives error
# messages.)
CO_LOCATION=external
MODULE_NAME=resources
INSTALL_FROM=`pwd`
mkdir -p $CO_LOCATION || exit 1
cd $CO_LOCATION || exit 1
cvs -d $CVSROOT checkout $MODULE_NAME || exit 1

# install them into the UNIX SCons build directory
scons -C $MODULE_NAME TARGET=$INSTALL_FROM/build || exit 1

case `uname` in
    *cygwin*|*CYGWIN*)
        # install them into the VC7 build directories
        scons -C $MODULE_NAME TARGET="$INSTALL_FROM/vc7/bin/Debug" || exit 1
        scons -C $MODULE_NAME TARGET="$INSTALL_FROM/vc7/bin/Release" || exit 1
        ;;
esac
