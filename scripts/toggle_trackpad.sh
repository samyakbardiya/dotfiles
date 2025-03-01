#!/usr/bin/env sh

_id=$(xinput list --name-only | grep -i touchpad)
echo "_id: $_id"

_status=$(xinput list-props "$_id" | grep 'Device Enabled' | awk '{print $(NF)}')
echo "_status: $_status"

if [ "$_status" -eq 1 ]; then
	echo "ON: $_id"
	xinput set-prop "$_id" "Device Enabled" 0
	notify-send -a 'Trackpad' 'DISABLED'
else
	# to remove a prefix from a string
	prefix="∼ "
	[ "${_id#"$prefix"}" != "$_id" ] && _id="${_id#"$prefix"}"

	xinput set-prop "$_id" "Device Enabled" 1
	notify-send -a 'Trackpad' 'ENABLED'
fi

xinput list-props "$_id" | grep 'Device Enabled'
