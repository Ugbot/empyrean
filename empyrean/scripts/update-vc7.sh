#!/bin/sh

die() {
    echo "Error, aborting..."
    exit 1
}

cd `dirname "$0"`/../resources || die
scons $1 || die

cd ../third-party-vc7 || die
scons $1 || die
