#!/bin/bash
set -e
echo Booting container with the following params:
echo $*

echo Fixing file permissions...
chown -R steam:steam /var/lib/csgo

echo Downloading counter-strike go...
bash $STEAMCMD_HOME/steamcmd.sh +login anonymous +force_install_dir /var/lib/csgo +app_update 740 validate +quit

echo Starting server...
bash $HOME/csgo/srcds_run $*
