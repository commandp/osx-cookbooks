#!/bin/bash
set -e

# Only run this script with root access
if [[ $EUID -ne 0 ]]; then
  echo "ERROR: Please run this script with sudo or as root" 1>&2
  exit 1
fi

echo "enable screensharing"
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist

echo "enable ssh service"
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

echo "disable sleep"
sudo pmset -a sleep 0
