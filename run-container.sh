#!/bin/bash
sudo docker run -e USERID=$(id -u) \
                -e GROUPID=$(id -g) \
                -v workdir:/workdir \
                -v $(pwd)/outputs:/mnt/outputs \
                -v $(pwd)/scripts:/usr/xbin:ro \
                -v $(pwd)/resources:/usr/share/wine-docker-builder:ro \
                -v $PWD/workdir:/home/builder \
                -w /home/builder \
                -it --rm wine-docker-builder bash --init-file /usr/xbin/startup.sh -ci "su builder"
