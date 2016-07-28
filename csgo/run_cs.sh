#!/bin/bash
set -e
echo Fixing file permissions...
chown -R steam:steam /var/lib/csgo

if [ ! -d /var/lib/csgo/csgo ] || [ "$UPDATE" == "true" ]; then
  echo Running CS GO downloader... 
  bash $STEAMCMD_HOME/steamcmd.sh +login anonymous +force_install_dir /var/lib/csgo +app_update 740 validate +quit
fi

echo Booting steam with the following paramters:
echo Game type: $GAME_TYPE
echo Game mode: $GAME_MODE
echo Map Group: $MAP_GROUP
echo Map: $MAP

echo Creating csgo server config...
cd /var/lib/csgo/csgo
cp -f /usr/local/share/csgo/gamemode* . 
cp -f /usr/local/share/csgo/server.cfg cfg/server.cfg
echo "rcon_password \"$RCON_PASSWORD\"" >> cfg/server.cfg
cd ..

echo Starting server...
bash ./srcds_run -game csgo -console -usercon -autoupdate -port 27015 +game_type $GAME_TYPE +game_mode $GAME_MODE +mapgroup $MAP_GROUP +map $MAP
