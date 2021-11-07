#!/bin/bash
# support for run as sudo
if [[ ! -z "${SUDO_UID}" ]]; then
    USERID="$SUDO_UID"
    GROUPID="$SUDO_GID"
else
    USERID="$(id -u)"
    GROUPID="$(id -g)"
fi

# create as original user if run as sudo
if [ ! -d "workdir" ]; then
    install -d -o "$USERID" -g "$GROUPID" -m 755 ./workdir
fi

if [ ! -d "outputs" ]; then
    install -d -o "$USERID" -g "$GROUPID" -m 755 ./outputs
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
