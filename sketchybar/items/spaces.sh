#!/usr/bin/env sh

SPACE_ICONS=("􀩼" "􀎬" "󰒱" "􀥲" "ε" "ζ" "η" "θ")

for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    if [ $sid -eq 3 ];then
                         F="$FONT":Bold:18.0
    else
                         F="$FONT":Bold:15.0
    fi

    sketchybar --add space space.$sid left     \
        --set space.$sid associated_space=$sid     \
                         icon=${SPACE_ICONS[i]}                     \
                         icon.padding_left=8                        \
                         icon.padding_right=8                       \
                         background.padding_left=5                  \
                         background.padding_right=5                 \
                         background.color=0x44ffffff                \
                         background.corner_radius=5                 \
                         background.height=22                       \
                         background.drawing=off                     \
                         label.drawing=off                          \
                         script="$PLUGIN_DIR/space.sh"              \
                         click_script="yabai -m space --focus $sid" \
                         icon.font="$F"
done
