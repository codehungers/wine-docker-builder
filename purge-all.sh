docker rmi $(docker images | grep 'registry.gitlab.steamos' | awk '{print $3}')
docker rmi $(docker images 'wine-docker-builder*' -a -q)