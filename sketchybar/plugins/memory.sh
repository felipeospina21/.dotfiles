#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

PAGE=$(pagesize)
TOGB=$((1024 ** 3))
ANONYMOUS=$(vm_stat | grep 'Anonymous' | awk '{print $3/1024}')
PURGEABLE=$(vm_stat | grep 'purgeable' | awk -v t="$TOGB" '{print $3}')
UNUSED=$(top -l 1 | grep 'unused' | awk '{print $8}')

APP_MEMORY=$(printf "%.2f\n" $(awk "BEGIN {print ((((($ANONYMOUS*$PAGE)-$PURGEABLE-$UNUSED)/$TOGB)*1024))}"))
WIRED_MEMORY=$(printf "%.2f\n" $(top -l 1 | grep 'wired' | awk -F '(' '{print $2}' | awk '{print $1/1024}'))
COMPRESSED=$(printf "%.2f\n" $(top -l 1 | grep 'compressor' | awk -F '(' '{print $2}' | awk '{print $3/1024}'))
MEMORY_USAGE=$(printf "%.2f\n" $(awk "BEGIN {print (($APP_MEMORY+$WIRED_MEMORY+$COMPRESSED)+0.529)}"))
# TOTAL_MEMORY=$(system_profiler SPHardwareDataType | grep -E -o "  Memory: \d+" | grep -E -o "\d+")
TOTAL_MEMORY=16
PERCENTAGE=$(echo "$MEMORY_USAGE" "$TOTAL_MEMORY" | awk '{printf "%.0f\n", ($1 / $2) * 100}')
#
# echo page $PAGE
# echo togb $TOGB
# echo anon $ANONYMOUS
# echo purg $PURGEABLE
# echo unused $UNUSED
# echo total $APP_MEMORY
# echo mem $MEMORY_USAGE
#
# echo perc $TOTAL_MEMORY
# echo perc $PERCENTAGE

COLOR=$WHITE
case "$PERCENTAGE" in
[3-4][0-9])
	COLOR=$YELLOW
	;;
[5-7][0-9])
	COLOR=$ORANGE
	;;
[8-9][0-9] | 100)
	COLOR=$RED
	;;
esac

sketchybar --set ram.percent label="$PERCENTAGE"% label.color="$COLOR"
