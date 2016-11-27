Runs a plex media server

User plex is id 1000 this is used on all docker containers to keep access simple
```
RUN useradd --system --uid 10000 -M --shell /usr/sbin/nologin plex
```

You must export the Config dir and data dir before running

```bash
 export PLEX_CONFIG_DIR=/Users/kmager/workspace/docker-plex/config/
 export PLEX_DATA_DIR=
 ```

 To start run the following
 ```bash
 docker-compose up -d
 ```

 Here is a list of ports we had to open to get auto discovery to work
```
ports:
- "32400:32400"
- "32400:32400/udp"
- "32410:32410/udp"
- "32412:32412/udp"
- "32413:32413/udp"
- "32414:32414/udp"
- "32469:32469"
- "32469:32469/udp"
- "5353:5353/udp"
- "8324:8324"
- "3005:3005"
- "1900:1900/udp"
```