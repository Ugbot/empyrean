#!/bin/sh
cd `dirname "$0"`/..
find src -name "*.cpp" -o -name "*.h" -o -name "*.c" | grep -v glew | grep -v glxew | xargs wc -l
