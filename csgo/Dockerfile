FROM fernandoalves/steamcmd:latest
MAINTAINER fernandoasfj@gmail.com

USER root
RUN mkdir -p /var/lib/csgo
RUN chown steam:steam /var/lib/csgo

RUN mkdir -p /usr/local/share/csgo
RUN chown steam:steam /usr/local/share/csgo

RUN apt-get -y install net-tools tcpdump sudo
RUN echo 'steam ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add our template files
ADD configs/ /usr/local/share/csgo/
USER steam

# Get steam logs out, probably needs to go in steamcmd container
RUN mkdir -p /home/steam/Steam/logs
RUN ln -sf /dev/stderr /home/steam/Steam/logs/stderr.txt 

VOLUME /var/lib/csgo
WORKDIR /var/lib/csgo

EXPOSE 27014-27050/tcp
EXPOSE 3478/udp
EXPOSE 4379-4380/udp
EXPOSE 27000-27030/udp
EXPOSE 51840/udp

ADD run_cs.sh /usr/local/bin/run_cs.sh
ENTRYPOINT ["/usr/local/bin/run_cs.sh"]
