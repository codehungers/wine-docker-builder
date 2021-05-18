#!/bin/bash

set -e

# We need glslang to build vkd3d-proton:

if [ -z "$1" ]; then
    echo "Makes a local build of mingw-w64 in this directory and installs it to the given path."
    echo ""
    echo "Note: Requires a system mingw-w64 compiler to be present already on your build machine, for us to bootstrap with."
    echo ""
    echo "usage:"
    echo -e "\t$0 <installation path e.g. \$HOME/.local>"
    exit 1
fi

if [ -z "$MAKEFLAGS" ]; then
    JOBS=-j$(($(nproc) - 1))
fi

DST_DIR="$1"

GLSLANG_VER=11.2.0
GLSLANG_SRCTARBALL=glslang-$GLSLANG_VER.tar.xz
GLSLANG_URL="https://github.com/KhronosGroup/glslang/archive/refs/tags/$GLSLANG_VER.tar.gz"
GLSLANG_SRCDIR=glslang-$GLSLANG_VER

function setup_src {

    if [ ! -e "$GLSLANG_SRCTARBALL" ]; then
        wget -O "$GLSLANG_SRCTARBALL" "$GLSLANG_URL"
    fi

    if [ ! -e "$GLSLANG_SRCDIR" ]; then
        tar -xf "$GLSLANG_SRCTARBALL"
    fi
}

function build {
    NEWPATH=$DST_DIR/bin:$PATH
    mkdir -p glslang/
    pushd glslang/
        if [ ! -e Makefile ]; then
            PATH=$NEWPATH:$PATH cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$DST_DIR ../$GLSLANG_SRCDIR
        fi
        PATH=$NEWPATH make $JOBS
        PATH=$NEWPATH make $JOBS install
    popd
}

setup_src

mkdir -p $DST_DIR

build

echo "Done!"
