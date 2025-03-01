#!/bin/sh

mode='life'

# weekdays: less than Saturday (6)
if [[ $(date +%u) -le 5 ]]; then
	# work dours: 09:00 to 18:59
	if [[ $(date +%_H) -ge 9 ]] && [[ $(date +%_H) -le 18 ]]; then
		mode='work'
	fi
fi

if [[ $mode = 'work' ]]; then
	# $BROWSER &
	# # restore brightness
	light -S 100
	# # turn off wifi, and use ethernet only
	# nmcli radio wifi off
	# program startup
	# brave --profile-directory="Profile 2" & # WORK
	# firefox-developer-edition &
	# librewolf &
	# firefox-developer-edition -P cumulations &
	# ferdium &
	# pomotroid --no-sandbox &
elif [[ $mode = 'life' ]]; then
	# restore brightness
	light -S 70
	# # turn on wifi
	# morgen &
	# nmcli radio wifi on
	# program startup
	# beeper --hidden &
	# discord --start-minimized &
	# kotatogram-desktop &
	# whatsapp-for-linux &
fi
