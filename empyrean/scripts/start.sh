#!/bin/sh

build/server &
build/client &
wait
