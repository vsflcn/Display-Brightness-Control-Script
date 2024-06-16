#!/bin/bash

#Function to manage brighness on MacOS
set_brightness_mac() {
    local brighness_level=$1
    osascript -e "tell application "\System Events\" to set brightness level of display 1 to $brighness_level
}

# Function to manage brightness on Linux
set_brightness_linux() {
    local brightness_level=$1
    current_hour=$(date +%H)
    if [ $current_hour -gt 8 ] && [ $current_hour -lt 20 ]; then
        xrandr --output eDP-1 --brightness $brightness_level
    else
        xrandr --output eDP-1 --brightness 0.3
    fi
}

# Function to manage brightness on Windows
set_brightness_windows() {
    local brightness_level=$1
    powershell.exe -ExecutionPolicy Bypass -Command "
    \$brightness = $brightness_level
    \$brightnessMethods = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods
    \$brightnessMethods.WmiSetBrightness(1, \$brightness)
    "
}

# Check for current operating system
case "$(uname -s)" in
    Darwin)
        # macOS
        echo "Running on macOS"
        set_brightness_mac 0.8  # Set brightness to 80%
        ;;
    Linux)
        # Linux
        echo "Running on Linux"
        set_brightness_linux 1.0  # Set brightness to 100%
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        # Windows
        echo "Running on Windows"
        set_brightness_windows 50  # Set brightness to 50%
        ;;
    *)
        # Another operating systems
        echo "Unsupported operating system"
        exit 1
        ;;
esac
