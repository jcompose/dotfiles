#!/usr/bin/env zsh

# Set directory
DIR="$HOME/.config/polybar/bars/"

killall -q polybar

polybar -q -r xworkspaces -c "$DIR"/modular.ini &
polybar -q -r powermenu -c "$DIR"/modular.ini &
polybar -q -r audio-output -c "$DIR"/modular.ini &
polybar -q -r sound -c "$DIR"/modular.ini &
polybar -q -r wlan -c "$DIR"/modular.ini &
polybar -q -r date -c "$DIR"/modular.ini &
polybar -q -r time -c "$DIR"/modular.ini &
polybar -q -r filesystem -c "$DIR"/modular.ini &

