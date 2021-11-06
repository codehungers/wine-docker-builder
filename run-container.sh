#!/bin/bash
if [[ ! -z "${SUDO_UID}" ]]; then
    USERID="$SUDO_UID"
    GROUPID="$SUDO_GID"
else
    USERID="$(id -u)"
    GROUPID="$(id -g)"
fi

tag=${1:-"latest"}
mkdir workdir &> /dev/null
mkdir outputs &> /dev/null
docker run  -e USERID=$USERID \
            -e GROUPID=$GROUPID \
            -v $PWD/outputs:/mnt/outputs \
            -v $PWD/scripts:/usr/xbin:ro \
            -v $PWD/resources:/usr/share/wine-docker-builder:ro \
            -v $PWD/workdir:/home/builder \
            -w /home/builder \
            -it --rm wine-docker-builder:$tag bash --init-file /usr/xbin/startup.sh -ci "su builder"
