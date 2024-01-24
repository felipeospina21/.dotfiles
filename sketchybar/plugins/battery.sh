#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
PLUGED=$(pmset -g batt | grep 'AC Power')
NOT_CHARGING=$(pmset -g batt | grep -o "not charging")

if [ $PERCENTAGE = "" ]; then
	exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
	ICON=$BATTERY_100
	;;
[6-8][0-9])
	ICON=$BATTERY_75
	;;
[3-5][0-9])
	ICON=$BATTERY_50
	;;
[1-2][0-9])
	ICON=$BATTERY_25
	;;
*) ICON="$BATTERY_10" ;;
esac

if [[ $PLUGED != "" && $NOT_CHARGING = "" ]]; then
	ICON=$BATTERY_CHARGING
elif [[ $PLUGED != "" && $NOT_CHARGING = "not charging" ]]; then
	ICON=$WARN
fi

sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
