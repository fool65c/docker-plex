#!/usr/bin/env bash

if [ -e ${HOME}/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid ]
then
  echo "Removing PID file"
  rm -f ${HOME}/Library/Application\ Support/Plex\ Media\ Server/plexmediaserver.pid
fi

echo "starting plexmediaserver"
/usr/sbin/start_pms