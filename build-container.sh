#!/bin/bash
sudo docker build -t wine-docker-builder-base ./docker
sudo docker build -t wine-docker-builder -f docker/Dockerfile.full ./docker