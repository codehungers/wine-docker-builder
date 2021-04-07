## Wine Docker Builder
welcome to wine docker builder. This project let you easily build wine inside docker container
### Advantages:

* Build wine in any host machine without the need to install all dependencies manually.
* Avoid contaminate your machine with tone of packages just for build wine.
* Anonymous building results - don't leave any marks of your host machine on the result compilation like username and symbols.
* Docker is cool!

## Instructions
### Build the docker container
need to build the docker container where the build process would happen this only happen once and can be updated when needed.
```
sudo docker build -t wine-docker-builder .
```
### Run the container 
This would launch the container with the environment ready to build wine.
```
sudo docker run -v workdir:/workdir -v $(pwd)/outputs:/mnt/outputs -v $(pwd)/scripts:/usr/local/bin:ro^Cv $(pwd)/resources:/usr/share/wine-docker-builder:ro -it wine-builder bash
```
### Working inside the container
here you can start pulling source and build wine.
#### Build wine-tkg example
```
git clone https://github.com/Frogging-Family/wine-tkg-git
cd wine-tkg-git/wine-tkg-git
./non-makepkg-build.sh
cd non-makepkg-builds
tar -cavf wine-tkg-6.5.tar.xz wine-tkg-6.5

```

### Publish to host
after you finish the build process and want publish the result to host machine you can run the following:
```
publish-host wine-tkg-6.5.tar.xz
```