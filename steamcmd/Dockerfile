FROM ubuntu:latest
MAINTAINER fernandoasfj@gmail.com

RUN apt-get update && apt-get -y install curl lib32gcc1

RUN useradd -m steam
USER steam
ENV STEAMCMD_HOME /home/steam/steamcmd
RUN mkdir -p $STEAMCMD_HOME && \
    cd $STEAMCMD_HOME && \
    curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xzv

WORKDIR $STEAMCMD_HOME
ENTRYPOINT $STEAMCMD_HOME/steamcmd.sh
