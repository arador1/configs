#! /usr/bin/bash
#
chosen=$(printf "󰐥 Power Off\n Restart\n󰤄 Suspend\n Lock\n⏼ Hibernate" | rofi -dmenu -i -l 3)
case "$chosen" in 
	"󰐥 Power Off") shutdown now;;
	" Restart") reboot ;;
     "󰤄 Suspend") systemctl suspend ;;
    " Lock") hyprlock ;;
    "⏼ Hibernate") systemctl hibernate ;; 
	*) exit 1 ;;
esac

