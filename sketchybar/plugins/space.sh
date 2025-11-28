#!/bin/bash

source "$CONFIG_DIR/colors.sh"

if [ "$SELECTED" = "true" ]; then
  sketchybar --set $NAME \
    icon.highlight=on \
    background.drawing=on \
    background.color=$SELECTION
else
  sketchybar --set $NAME \
    icon.highlight=off \
    background.drawing=off
fi
