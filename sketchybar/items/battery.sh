#!/usr/bin/env sh

sketchybar --add item battery right \
	--set battery script="$PLUGIN_DIR/battery.sh" \
	update_freq=60*5 \
	--subscribe battery system_woke

sketchybar --add alias "Control Center,Battery" right
