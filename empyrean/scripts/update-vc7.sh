#!/bin/sh
cd `dirname "$0"`/../resources
scons $1

cd ../third-party-vc7
scons $1
