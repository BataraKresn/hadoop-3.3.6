#!/bin/bash

# Set supervisor executable path
SUPERVISOR_PATH="./build/env/bin/supervisor"

# Check if supervisor exists and is executable
if [[ -x "$SUPERVISOR_PATH" ]]; then
    $SUPERVISOR_PATH
else
    echo "Supervisor not found. Attempting to start Hue services directly."
    # Try starting Hue directly if supervisor is missing
    if [[ -x "/hue/build/env/bin/hue" ]]; then
        /hue/build/env/bin/hue runserver 0.0.0.0:8888
    else
        echo "Hue executable not found. Please check your installation."
        exit 1
    fi
fi
