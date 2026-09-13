#!/bin/sh
# Launch alacritty at a smaller font size when opened on the big monitor (HDMI-A-1).
output=$(swaymsg -t get_outputs | python3 -c "import json,sys; d=json.load(sys.stdin); print(next((o['name'] for o in d if o.get('focused')), ''))")

if [ "$output" = "HDMI-A-1" ]; then
    exec alacritty -o font.size=8.8 "$@"
else
    exec alacritty "$@"
fi
