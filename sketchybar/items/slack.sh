#!/usr/bin/env sh
#
# PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
sketchybar --add item slack right \
	--set slack \
	update_freq=10 \
	script="$PLUGIN_DIR/slack.sh" \
	background.padding_right=15 \
	icon.font.size=18 \
	--subscribe slack system_woke

sketchybar --add alias "Slack" right
