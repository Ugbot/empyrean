#!/bin/sh

cd build && ( ( ./client & ) ; ./server )
