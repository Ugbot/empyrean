#!/bin/sh

die() {
    echo "Error, aborting..."
    exit 1
}

ROOT=`pwd`

cd resources || die
scons $1 || die
