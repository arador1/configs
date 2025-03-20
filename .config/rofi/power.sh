#! /usr/bin/bash
#
chosen=$(printf "󰐥 Power Off\n Restart\n Lock" | rofi -dmenu -i -l 3)
case "$chosen" in
"󰐥 Power Off") shutdown now ;;
" Restart") reboot ;;
" Lock") hyprlock ;;
*) exit 1 ;;
esac
