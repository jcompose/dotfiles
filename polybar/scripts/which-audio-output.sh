#!/bin/zsh

sink=$(pactl get-default-sink)

if [[ "$sink" == "alsa_output.pci-0000_00_1f.3.analog-stereo" ]]; then
	echo "Speakers"
elif [[ "$sink" == "alsa_output.usb-Focusrite_Scarlett_Solo_USB-00.analog-stereo" ]]; then
	echo "Headphones"
fi
