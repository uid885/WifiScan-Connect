#!/bin/bash -
# Author:           Christo Deale                  
# Date  :           2023-11-21            
# WifiScan&Connect: Utility to Scan Wifi from terminal & Connect

# Check if Wi-Fi is enabled
wifi_status=$(nmcli device | grep "wifi" | awk '{print $3}')
if [ "$wifi_status" != "enabled" ]; then
    echo "Wi-Fi is currently disabled. Enabling it..."
    rfkill unblock wifi
    nmcli radio wifi on
    echo "Wi-Fi enabled."
fi

# List available Wi-Fi networks
echo "Available Wi-Fi networks:"
nmcli device wifi list

# Prompt user for preferred Wi-Fi SSID
read -p "Enter the preferred Wi-Fi SSID to connect to: " ssid

# Prompt user for Wi-Fi password
read -s -p "Enter the password for the Wi-Fi network: " password
echo

# Connect to the selected Wi-Fi network
nmcli device wifi connect "$ssid" password "$password"

echo "Connected to $ssid successfully."
