#!/bin/bash
wget https://raw.githubusercontent.com/Frogging-Family/wine-tkg-git/master/wine-tkg-git/wine-tkg-scripts/deps
# git clone https://github.com/Frogging-Family/wine-tkg-git
# depfile="wine-tkg-git/wine-tkg-git/wine-tkg-scripts/deps"
depfile=deps
sed -i s/apt\ install/apt\ install\ -y/g $depfile
source $depfile
DEBIAN_FRONTEND=noninteractive _debuntu_64
DEBIAN_FRONTEND=noninteractive _debuntu_32
rm -rf *