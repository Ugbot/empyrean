#!/bin/sh
cd `dirname "$0"`/..
build/server &
build/client &
wait
