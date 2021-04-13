#!/bin/bash
sudo docker run -v workdir:/workdir -v $(pwd)/outputs:/mnt/outputs -v $(pwd)/scripts:/usr/xbin:ro -v $(pwd)/resources:/usr/share/wine-docker-builder:ro -it wine-docker-builder bash -c 'export PATH=$PATH:/usr/xbin; bash'
