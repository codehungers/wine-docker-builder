## Wine Docker Builder
Welcome to wine docker builder. This project let you easily build wine inside docker container.
### Advantages:

* Build wine in any host machine without the need to install all dependencies manually.
* Avoid contaminate your machine with tone of packages just for build wine.
* Anonymous building results - don't leave any marks of your host machine on the result compilation like username and symbols.
* Docker is cool!

## Instructions
### Build the docker container
Need to build the docker container where the build process would happen this only happen once and can be updated when needed.
```
./build-container.sh
```
### Run the container 
This would launch the container with the environment ready to build wine.
```
./run-container.sh
```
### User configs and patches
you can put your own configs and patches inside "resources/config" and "resources/patches" folders and build them inside the container.
### Working inside the container
You are now inside the docker container here you can start working on building wine by automatic commands or do it yourself manually.
#### Container commands
You can run those automatic commands directly in shell `$ command-name` they are already in PATH:
- `wine-tkg-build` - build latest wine-tkg with chaotic-staging config.
- `proton-tkg-build` - build latest proton-tkg with default config (resources/configs/proton-tkg-std.cfg)
#### Container commands optional parameters
The above command now also support optional parameters `command <config-filename> <version>`.
- `<config-filename>` - config filename(and not a path) that located inside "resources/config/" folder or already exist on wine-tkg project
- `<version>` - this parameter will set the _plain_version and _staging_version  of wine-tkg config see [wine-tkg config](https://github.com/Frogging-Family/wine-tkg-git/blob/master/wine-tkg-git/customization.cfg#L35)
#### Outputs
All compilation final outputs will be copied into "outputs" folder so you can access them in host machine.
- `publish-host` - when working manually you can use the publish-host <filename> to automatic copy the compilation final outputs.

#### Manually Build wine-tkg example
```
git clone https://github.com/Frogging-Family/wine-tkg-git
cd wine-tkg-git/wine-tkg-git
./non-makepkg-build.sh
cd non-makepkg-builds
tar -cavf wine-tkg-6.5.tar.xz wine-tkg-6.5
publish-host wine-tkg-6.5.tar.xz
```
#### Finish Working inside the container and going back to host
Just run `exit` then you got back to host machine, you can look inside the outputs folder to see the compilation results `ls -la ./outputs`.
