#!/usr/bin/env sh

sketchybar -m --add item ram.top right \
	--set ram.top label.font="$FONT:Medium:7" \
	label=RAM \
	icon.drawing=off \
	width=0 \
	y_offset=6 \
	background.padding_right=10 \
	\
	--add item ram.percent right \
	--set ram.percent label.font="$FONT:Bold:12" \
	label=RAM \
	y_offset=-4 \
	width=40 \
	icon.drawing=off \
	update_freq=2 \
	background.padding_right=10 \
	script="$PLUGIN_DIR/memory.sh"

# ram script="$PLUGIN_DIR/memory.sh"
