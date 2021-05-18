FROM ubuntu:focal
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN apt-get install -y git wget
# RUN rm -rf /var/lib/apt/lists/*
ENV HOME /root
# sed -i s/apt\ install/apt\ install\ -y/g "wine-tkg-scripts/deps"
RUN mkdir /workdir
# RUN mkdir /usr/bin/wine-docker-builder
WORKDIR /workdir
COPY install.sh install.sh
RUN chmod +x install.sh
RUN ./install.sh && rm -rf *