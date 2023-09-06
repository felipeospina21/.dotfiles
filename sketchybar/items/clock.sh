#!/usr/bin/env sh

sketchybar --add item clock right \
	--set clock update_freq=1 padding_right=3 \
	script="$PLUGIN_DIR/clock.sh"
