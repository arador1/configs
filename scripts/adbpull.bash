#!/bin/bash

# Step 1: List files on the adb device (e.g., from /sdcard)
echo "Fetching file list from device..."
file_on_device=$(adb shell find /storage/emulated/0/ -type f 2>/dev/null | fzf --prompt="Select a file on device: ")

if [[ -z "$file_on_device" ]]; then
  echo "No file selected, exiting."
  exit 1
fi

# Step 2: Select local directory to save to
echo "Select a local directory to save the file:"
local_dir=$(find "$HOME" -type d 2>/dev/null | fzf --prompt="Select local directory: ")

if [[ -z "$local_dir" ]]; then
  echo "No local directory selected, exiting."
  exit 1
fi

# Step 3: Pull the file from device to local directory
echo "Pulling $file_on_device to $local_dir ..."
adb pull "$file_on_device" "$local_dir"

echo "Done."

