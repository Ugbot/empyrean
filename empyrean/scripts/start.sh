#!/bin/sh
cd `dirname "$0"`/..
(GMON_OUT_PREFIX=server.profile build/server) &
sleep 1  # We want the client to appear on top.
(GMON_OUT_PREFIX=client.profile nice -n 1 build/client) &
wait
