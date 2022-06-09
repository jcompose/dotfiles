#!/bin/zsh

API_KEY=$(cat ~/.api_keys/TWITCH_API_KEY)
ISLIVE=$(curl -s -X GET "https://api.twitch.tv/helix/streams?user_login=$1" \
	-H "Authorization: Bearer $API_KEY" \
-H "Client-Id: euvt37d8eaujg0i06y5uk4f85nvc3n" | jq '.data | .[0] | .type')

if [[ "$ISLIVE" == "\"live\"" ]]; then
	RED="$(xrdb -get color1)"
	echo "%{F$RED}雷 $1 is %{u$RED +u}LIVE!%{u- F-}"
else
	echo "$1 is offline"
fi
