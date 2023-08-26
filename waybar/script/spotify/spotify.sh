#!/bin/zsh

if [ $1 = "Paused" ]; then
    echo " $1"
else
    id=$(playerctl metadata --format '{{mpris:trackid}}' -p spotify | cut -b 20-)
    md=$(playerctl metadata --format '󰓇 {{title}}{{album}}{{artist}}' -p spotify)
    track=$(curl --request GET --url https://api.spotify.com/vl/tracks/$id)
    echo "$md"
fi
