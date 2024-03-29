#!/bin/bash

# Used in Docker build to set platform dependent variables

case $TARGETARCH in

    "amd64")
    echo "x86_64-unknown-linux-gnu" > /.platform
    echo "" > /.compiler
    echo "strip" > /.strip
    ;;
    "arm64") 
    echo "aarch64-unknown-linux-gnu" > /.platform
    echo "gcc-aarch64-linux-gnu" > /.compiler
    echo "aarch64-linux-gnu-strip" > /.strip
    ;;
    "arm")
    echo "armv7-unknown-linux-gnueabihf" > /.platform
    echo "gcc-arm-linux-gnueabihf" > /.compiler
    echo "arm-linux-gnueabihf-strip" > /.strip
    ;;
esac
