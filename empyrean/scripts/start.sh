#!/bin/sh
cd `dirname "$0"`/..
build/server &
usleep 500000  # We want the client to appear on top.
nice -n 1 build/client &
wait
