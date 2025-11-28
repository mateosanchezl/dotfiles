#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

VOLUME=$(osascript -e 'output volume of (get volume settings)')
MUTED=$(osascript -e 'output muted of (get volume settings)')

if [ "$MUTED" = "true" ] || [ "$VOLUME" -eq 0 ]; then
  ICON=$ICON_VOLUME_MUTE
  COLOR=$DARK_GRAY
elif [ "$VOLUME" -gt 66 ]; then
  ICON=$ICON_VOLUME_HIGH
  COLOR=$YELLOW
elif [ "$VOLUME" -gt 33 ]; then
  ICON=$ICON_VOLUME_MED
  COLOR=$YELLOW
else
  ICON=$ICON_VOLUME_LOW
  COLOR=$YELLOW
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR label="${VOLUME}%"
