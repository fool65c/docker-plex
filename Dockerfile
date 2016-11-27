from ubuntu:16.04

# package version
ENV DEBIAN_FRONTEND="noninteractive"
ENV HOME="/config"
ENV PLEX_INSTALL="https://downloads.plex.tv/plex-media-server/1.2.7.2987-1bef33a/plexmediaserver_1.2.7.2987-1bef33a_amd64.deb"

# update 
RUN apt-get update

# install curl
RUN apt-get install -y curl

# create plex user
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin plex

# make home dir
RUN mkdir -p ${HOME}
RUN chown plex ${HOME}

# install plex
RUN  curl -o /tmp/plexmediaserver.deb -L "${PLEX_INSTALL}"
RUN  dpkg -i /tmp/plexmediaserver.deb

# expose plex ports
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp

# docker volumes
VOLUME /config /transcode

COPY ./start_plex.sh /usr/sbin/start_plex.sh
RUN chmod a+x /usr/sbin/start_plex.sh


# run plex
USER plex
CMD ["/usr/sbin/start_plex.sh"]


