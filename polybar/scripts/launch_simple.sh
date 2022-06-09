#!/usr/bin/env zsh

# Set directory
DIR="$HOME/.config/polybar/bars"

killall -q polybar

polybar -q -r main -c "$DIR"/simple.ini &
