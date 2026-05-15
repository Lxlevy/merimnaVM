#!/bin/bash

# Install desktop environment based on options.json
OPTIONS_FILE="/options.json"

# Read the selected DE from options.json
DE=$(jq -r '.DE' "$OPTIONS_FILE")

echo "Installing desktop environment: $DE"

case "$DE" in
  "KDE Plasma (Heavy)")
    apt-get install -y kde-plasma-desktop
    ;;
  "XFCE4 (Lightweight)")
    apt-get install -y xfce4 xfce4-goodies
    ;;
  "I3 (Very Lightweight)")
    apt-get install -y i3 i3status dmenu
    ;;
  "GNOME 42 (Very Heavy)")
    apt-get install -y gnome-shell gnome-desktop-environment
    ;;
  "Cinnamon")
    apt-get install -y cinnamon
    ;;
  "LXQT (Very Lightweight)")
    apt-get install -y lxqt
    ;;
  *)
    echo "Unknown DE, installing XFCE4 as default"
    apt-get install -y xfce4 xfce4-goodies
    ;;
esac

echo "Desktop environment installation complete!"
