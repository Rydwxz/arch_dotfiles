#!/bin/zsh
spot=$(playerctl status -p spotify)
fire=$(playerctl status -p firefox)
if [ $fire = "Playing"   ]; then
    echo " 󰈹 $(playerctl metadata --format '{{xesam:title}}{{xesam:artist}}')"
elif [ $spot != "No players found" ]; then
    ~/.config/waybar/script/spotify/spotify.sh $spot
else
    echo ""
fi
