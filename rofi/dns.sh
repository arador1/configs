#!/bin/bash

# Display options in Rofi menu
action=$(echo -e "Connect\nDisconnect" | rofi -dmenu -p "Warp")

# Perform action based on selection
case "$action" in
"Connect")
  # Check if Warp is already connected
  status=$(warp-cli status | grep "Status update" | awk '{print $3}')

  if [ "$status" = "Connected" ]; then
    notify-send "Warp Status" "Warp is already connected."
  else
    notify-send "Warp Status" "Connecting to Warp..."
    warp-cli connect

    # Add a delay before checking the connection
    sleep 2

    # Check the status again to confirm connection
    new_status=$(warp-cli status | grep "Status update" | awk '{print $3}')
    if [ "$new_status" = "Connected" ]; then
      notify-send "Warp Status" "Successfully connected to Warp."
    else
      notify-send "Warp Status" "Failed to connect to Warp."
    fi
  fi
  ;;
"Disconnect")
  # Check if Warp is already disconnected
  status=$(warp-cli status | grep "Status update" | awk '{print $3}')

  if [ "$status" = "Disconnected" ]; then
    notify-send "Warp Status" "Warp is already disconnected."
  else
    notify-send "Warp Status" "Disconnecting from Warp..."
    warp-cli disconnect

    # Add a delay before checking the disconnection
    sleep 2

    # Check the status again to confirm disconnection
    new_status=$(warp-cli status | grep "Status update" | awk '{print $3}')
    if [ "$new_status" = "Disconnected" ]; then
      notify-send "Warp Status" "Successfully disconnected from Warp."
    else
      notify-send "Warp Status" "Failed to disconnect from Warp."
    fi
  fi
  ;;
*)
  notify-send "Warp Status" "No valid option selected."
  ;;
esac
