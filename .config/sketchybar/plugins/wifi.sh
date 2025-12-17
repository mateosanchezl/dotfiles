#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

WIFI=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
SSID=$(echo "$WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')

if [ -z "$SSID" ]; then
  sketchybar --set $NAME icon=$ICON_WIFI_OFF icon.color=$RED label="Off"
else
  sketchybar --set $NAME icon=$ICON_WIFI icon.color=$PURPLE label="$SSID"
fi
