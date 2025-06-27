#!/bin/bash

setxkbmap us

selected_url=$(grep -v '^#' ~/Sync/bookmark/bookmark | dmenu -i -l 50 | cut -d' ' -f1)

if [ -n "$selected_url" ]; then
    xdotool type "$selected_url"
fi

setxkbmap se
