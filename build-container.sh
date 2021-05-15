#!/bin/bash
function docker-ubuntu-bionic {
    pushd "docker/ubuntu-18.04"
        make pull
        sudo docker build -f proton.Dockerfile -t proton "build/"
        sudo docker build -f Dockerfile -t proton-docker-builder:18.04 "build/"
    popd
}

function docker-ubuntu-focal {
    sudo docker build -t wine-docker-builder-base ./docker
    sudo docker build -t wine-docker-builder -f docker/Dockerfile.full ./docker
}

version=${1:-"20.04"}

if [ $version = "18.04" ]; then
    docker-ubuntu-bionic
else
    docker-ubuntu-focal
fi