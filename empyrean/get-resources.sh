#!/bin/sh

die() {
    echo "Error, aborting..."
    exit 1
}

ROOT=`pwd`

cd resources || die

# install them into the UNIX SCons build directory
scons TARGET=$ROOT/build $1 || die

case `uname` in
    *cygwin*|*CYGWIN*)
        # install them into the VC7 build directories
        scons TARGET="$ROOT/vc7/bin/Debug"   $1 || die
        scons TARGET="$ROOT/vc7/bin/Release" $1 || die
        ;;
esac
