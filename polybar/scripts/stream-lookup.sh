#!/bin/sh

update-streamer-statuses
count="$(cat ~/Documents/streamstatus | grep "雷" | wc -l)"
RED="$(xrdb -get color1)"

if [[ $count -eq 0 ]]; then echo "Nobody is streaming :("
elif [[ $count -eq 1 ]]; then echo "%{F$RED}雷 $count streamer is %{u$RED +u}LIVE!%{u- F-}"
else echo "%{F$RED}雷 $count streamers are %{u$RED +u}LIVE!%{u- F-}"
fi

