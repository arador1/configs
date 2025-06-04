#!/bin/bash

# Kill all instances of hyprpaper and waybar
killall hyprpaper waybar

# Wait a moment to ensure they are terminated
sleep 1

# Restart hyprpaper and waybar
hyprpaper &
waybar &
