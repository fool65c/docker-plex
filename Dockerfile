from ubuntu:16.04

# package version
ENV PLEX_INSTALL="https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu"

# update 
RUN apt-get update

# install curl
RUN apt-get install -y curl

# create plex user
RUN useradd --system --uid 10000 -M --shell /usr/sbin/nologin plex

# install plex
RUN  curl -o /tmp/plexmediaserver.deb -L "${PLEX_INSTALL}"
RUN  dpkg -i /tmp/plexmediaserver.deb


