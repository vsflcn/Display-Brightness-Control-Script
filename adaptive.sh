#!/bin/bash

#Function to manage brighness on MacOS
set_brightness_mac() {
    local brighness_level=$1
    osascript -e "tell application "\System Events\" to set brightness level of display 1 to $brighness_level
}