#!/bin/bash
sudo docker run -v workdir:/workdir -v $(pwd)/outputs:/mnt/outputs -v $(pwd)/scripts:/usr/local/bin:ro -v $(pwd)/resources:/usr/share/wine-docker-builder:ro -it wine-builder bash
