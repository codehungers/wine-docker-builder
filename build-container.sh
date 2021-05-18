#!/bin/bash
function docker-ubuntu-bionic {
    pushd "docker/ubuntu-18.04"
        make pull
        docker build -f proton.Dockerfile -t proton "build/"
        docker build -f Dockerfile -t proton-docker-builder:18.04 "build/"
    popd
}

function docker-ubuntu-focal {
    docker build -t wine-docker-builder-base ./docker
    docker build -t wine-docker-builder -f docker/Dockerfile.full ./docker
}

version=${1:-"20.04"}

if [ $version = "18.04" ]; then
    docker-ubuntu-bionic
else
    docker-ubuntu-focal
fi