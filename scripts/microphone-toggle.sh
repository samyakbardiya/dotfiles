#!/usr/bin/env sh

realme_buds=$(bluetoothctl info | grep 'realme Buds Wireless 3')
aac=$(pactl list | grep Active | grep 'aac')
card=$(pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2)
# source=1397 # Built-in Audio Analog Stereo

if [ -n "$realme_buds" ]; then
	if [ -n "$aac" ]; then
		echo "Switching $card to MSBC..."
		pactl set-card-profile $card headset-head-unit-msbc
		pamixer --default-source --unmute
		echo "...done"
		notify-send -a "Microphone Toggle" "realme Buds W3" "Switched to MSBC"
	else
		echo "Switching $card to AAC..."
		pactl set-card-profile $card a2dp-sink-aac
		pamixer --default-source --mute
		echo "...done"
		notify-send -a "Microphone Toggle" "realme Buds W3" "Switched to AAC"
	fi
fi
