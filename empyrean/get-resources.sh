#!/bin/sh

die() {
    echo "Error, aborting..."
    exit 1
}

INSTALL_FROM=`pwd`

cd resources || die

# install them into the UNIX SCons build directory
scons TARGET=$INSTALL_FROM/build || die

case `uname` in
    *cygwin*|*CYGWIN*)
        # install them into the VC7 build directories
        scons TARGET="$INSTALL_FROM/vc7/bin/Debug" || die
        scons TARGET="$INSTALL_FROM/vc7/bin/Release" || die
        ;;
esac
