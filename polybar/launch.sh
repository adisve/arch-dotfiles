#!/usr/bin/env sh

CONFIG_LOCATION=/home/"$USER"/.config/polybar/config.ini
BAR=base
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done
polybar --reload "$BAR" -q -c "$CONFIG_LOCATION" &

echo "Bar launched..."