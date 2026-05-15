#!/bin/bash

# Install desktop environment based on options.json
OPTIONS_FILE="/options.json"

# Read the selected DE from options.json
DE=$(jq -r '.DE' "$OPTIONS_FILE")

echo "Installing desktop environment: $DE"

case "$DE" in
  "KDE Plasma (Heavy)")
    apt-get install -y kde-plasma-desktop
    echo "exec startplasma-x11" > /etc/xdg/openbox/environment
    ;;
  "XFCE4 (Lightweight)")
    apt-get install -y xfce4 xfce4-goodies
    echo "exec startxfce4" > /etc/xdg/openbox/environment
    ;;
  "I3 (Very Lightweight)")
    apt-get install -y i3 i3status dmenu
    echo "exec i3" > /etc/xdg/openbox/environment
    ;;
  "GNOME 42 (Very Heavy)")
    apt-get install -y gnome-shell gnome-desktop-environment
    echo "exec gnome-session" > /etc/xdg/openbox/environment
    ;;
  "Cinnamon")
    apt-get install -y cinnamon
    echo "exec cinnamon-session" > /etc/xdg/openbox/environment
    ;;
  "LXQT (Very Lightweight)")
    apt-get install -y lxqt
    echo "exec startlxqt" > /etc/xdg/openbox/environment
    ;;
  *)
    echo "Unknown DE, installing XFCE4 as default"
    apt-get install -y xfce4 xfce4-goodies
    echo "exec startxfce4" > /etc/xdg/openbox/environment
    ;;
esac

echo "Desktop environment installation complete!"
