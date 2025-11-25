#!/usr/bin/env bash

source "$CONFIG_DIR/lib/colors.sh"

if [ "$SELECTED" = "true" ]; then
  sketchybar --animate tanh 15 --set "$NAME" \
    background.color=$ITEM_BG_SELECTED \
    icon.color=$GRUV_DARK0
else
  sketchybar --animate tanh 15 --set "$NAME" \
    background.color=$ITEM_BG \
    icon.color=$ITEM_SUBTLE
fi
