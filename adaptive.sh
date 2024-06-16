#!/bin/bash

#Function to manage brighness on MacOS
set_brightness_mac() {
    local brighness_level=$1
    osascript -e "tell application "\System Events\" to set brightness level of display 1 to $brighness_level
}

#Function to manage brightness on Linux
set_brightness_linux() {
    local brightness level=$1
    current_hour=$(date + "%H")
    if [ current_hour -gt 8 ] && [ current_hour -lt 21 ]
    then
        xrandr --output eDP-1 --brightness $brighness_level
    else
        xrandr --output eDP-1 --brightness 0.3
    fi
}

#Function to manage brightness on Windows
set_brightness_linux() {
    local brightness level=$1
    powershell.exe -ExecutionPolicy Bypass -Command "& {Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods | foreach { $_.WmiSetBrightness(1, $brightness_level) }}"
}