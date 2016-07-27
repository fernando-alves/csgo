FROM fernandoalves/steamcmd:latest
MAINTAINER fernandoasfj@gmail.com

USER root
RUN mkdir -p /var/lib/csgo
RUN chown steam:steam /var/lib/csgo
USER steam

VOLUME /var/lib/csgo
WORKDIR /var/lib/csgo
 
EXPOSE 27015

ADD run_cs.sh /usr/local/bin/run_cs.sh
ENTRYPOINT ["/usr/local/bin/run_cs.sh"] 
