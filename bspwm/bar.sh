#!/bin/bash

get_battery() {
    # This works for most laptops using standard battery path
    bat=/sys/class/power_supply/BAT1
    if [ -d "$bat" ]; then
        capacity=$(cat $bat/capacity)
        status=$(cat $bat/status)
        echo "$capacity% ($status)"
    else
        echo "NoBattery"
    fi
}

while true; do
    # Time
    time=$(date "+%H:%M")

    # Battery
    battery=$(get_battery)

    # Workspaces
    ws=$(bspc wm -d | jq -r '.monitors[0].desktops[] | if .focused then "[\(.name)]" else "\(.name)" end' | xargs)

    # Final bar layout
    echo "%{l}$ws %{r}$battery  |  $time"
    sleep 1
done | lemonbar -g x24 -p -B '#1e1e2e' -F '#cdd6f4' -f "monospace-9"

