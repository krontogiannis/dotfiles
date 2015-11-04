#!/usr/bin/env bash

if [ $4 ]; then
    LOL_APP="/Applications/League*of*Legends.app"
    LOL_GAME_CLIENT_DIR="$LOL_APP/Contents/LoL/RADS/solutions/lol_game_client_sln/releases/*/deploy/LeagueOfLegends.app/Contents/MacOS"
    cd $LOL_GAME_CLIENT_DIR
    riot_launched=true nohup "$(ls -1 $LOL_GAME_CLIENT_DIR/LeagueofLegends)" 8394 LoLLauncher "$LOL_APP/Contents/LoL/RADS/projects/lol_air_client/releases/*/deploy/bin/LolClient" "spectator $1 $2 $3 $4" >/dev/null 2>&1
else
    echo usage: \`spectate [ip:port] [token] [number] [region]\`

fi
