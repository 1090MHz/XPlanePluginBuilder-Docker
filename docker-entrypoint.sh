#!/bin/bash
set -e

if [ "$1" = 'build' ]; then
    mkdir -p build
    cd build
    cmake ..
    exec make
else
    exec "$@"
fi
