#!/bin/bash

# Kill existing Polybar instance
killall -q polybar

# Wait a bit for the process to die
while pgrep -x polybar >/dev/null; do sleep 1; done

# Start a new Polybar instance
polybar fk &

echo "Polybar reloaded..."

