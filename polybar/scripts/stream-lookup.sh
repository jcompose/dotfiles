#!/bin/zsh

API_KEY=$(cat ~/.api_keys/TWITCH_API_KEY)
list=$(curl -s -X GET "https://api.twitch.tv/helix/users/follows?from_id=150805300" \
	-H "Authorization: Bearer $API_KEY" \
	-H "Client-Id: euvt37d8eaujg0i06y5uk4f85nvc3n" | jq '.data | .[] | .to_name' \
	| sed 's/"\(.*\)"/\1/')

count=0
declare -i count

for line in $list
do
	ISLIVE=$(curl -s -X GET "https://api.twitch.tv/helix/streams?user_login=$line" \
		-H "Authorization: Bearer $API_KEY" \
	-H "Client-Id: euvt37d8eaujg0i06y5uk4f85nvc3n" | jq '.data | .[0] | .type')

	if [[ "$ISLIVE" == "\"live\"" ]]; then
		count+=1
	fi
done

RED="$(xrdb -get color1)"

if [[ $count -eq 0 ]]; then
	echo "Nobody is streaming :("
elif [[ $count -eq 1 ]]; then
	echo "%{F$RED}雷 $count streamer is %{u$RED +u}LIVE!%{u- F-}"
else
	echo "%{F$RED}雷 $count streamers are %{u$RED +u}LIVE!%{u- F-}"
fi
