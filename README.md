# Display Brightness Control Script
Adaptive Bash script file for Linux, MacOS and Windows

## Usage
### Running the Script
Download the brightness_control.sh file.
    
Open a terminal (command prompt) on your device.

### Executing the Script
Run the script using the following command:

        bash adaptive.sh

Expected Behavior
    The script will automatically identify the operating system and set the display brightness based on predefined parameters:
    1) On macOS, brightness will be set to 80%.
    2) On Linux, brightness will adjust depending on the time of day (100% or 50%).
    3) On Windows, brightness will be set to 50%.

### Requirements

macOS:
    Requires AppleScript support for brightness control.

Linux:
    Requires xrandr package installed.
    Ensure correct display identifier (eDP-1 in the example).

Windows:
    Requires PowerShell with script execution policy enabled.
    Administrator rights for brightness adjustment.

### Features

    Adaptability: Automatically selects the appropriate brightness adjustment method based on the detected OS.
    Flexibility: Easily configurable for different settings and displays if needed.

#### Notes

    Adjust the display identifier (eDP-1) on Linux as per your specific display setup.
    Ensure proper system configuration and permissions for macOS and Windows to ensure script functionality.
