#!/usr/bin/env sh

#### Apple Logo ####
sketchybar -m \
	--add item apple.logo left \
	--set apple.logo icon=$APPLE_ICN \
	icon.font="$FONT:Heavy:16.0" \
	label.drawing=off \
	icon.padding_right=17 \
	click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
	popup.background.border_width=2 \
	popup.background.corner_radius=3 \
	popup.background.border_color="${TRANSPARENT_BLACK}" \
	popup.background.color="${TRANSPARENT_BLACK}" \
	\
	--default background.padding_left=5 \
	background.padding_right=5 \
	icon.padding_right=5 \
	icon.font="$FONT:Bold:16.0" \
	label.font="$FONT:Semibold:13.0" \
	\
	--add item apple.preferences popup.apple.logo \
	--set apple.preferences icon=􀺽 \
	label="Preferences" \
	click_script="open -a 'System Preferences';                    
                                             sketchybar -m --set apple.logo popup.drawing=off" \
	--add item apple.activity popup.apple.logo \
	--set apple.activity icon=􀒓 \
	label="Activity" \
	click_script="open -a 'Activity Monitor';                       
                                             sketchybar -m --set apple.logo popup.drawing=off" \
	--add item apple.lock popup.apple.logo \
	--set apple.lock icon=􀒳 \
	label="Lock Screen" \
	click_script="pmset displaysleepnow;                           
                                             sketchybar -m --set apple.logo popup.drawing=off"
