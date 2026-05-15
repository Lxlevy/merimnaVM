#!/bin/bash

# This script installs applications based on the options.json configuration
# It's called during Docker build

# Read the options.json file
OPTIONS_FILE="/options.json"

# Firefox is installed by default (already in Dockerfile)

# PROGRAMMING & DEVELOPMENT
echo "Installing programming tools..."
if jq ".programming[] | select(. == 0)" "$OPTIONS_FILE" > /dev/null; then echo "Installing Python 3..."; apt-get install -y python3 python3-pip; fi
if jq ".programming[] | select(. == 1)" "$OPTIONS_FILE" > /dev/null; then echo "Installing OpenJDK 8..."; apt-get install -y openjdk-8-jre; fi
if jq ".programming[] | select(. == 2)" "$OPTIONS_FILE" > /dev/null; then echo "Installing OpenJDK 17..."; apt-get install -y openjdk-17-jre; fi
if jq ".programming[] | select(. == 3)" "$OPTIONS_FILE" > /dev/null; then echo "Installing VSCodium..."; apt-get install -y codium; fi
if jq ".programming[] | select(. == 4)" "$OPTIONS_FILE" > /dev/null; then echo "Installing Git..."; apt-get install -y git; fi
if jq ".programming[] | select(. == 5)" "$OPTIONS_FILE" > /dev/null; then echo "Installing Node.js..."; apt-get install -y nodejs npm; fi

# UTILITIES
echo "Installing utilities..."
if jq ".utilities[] | select(. == 0)" "$OPTIONS_FILE" > /dev/null; then echo "Installing VLC..."; apt-get install -y vlc; fi
if jq ".utilities[] | select(. == 1)" "$OPTIONS_FILE" > /dev/null; then echo "Installing LibreOffice..."; apt-get install -y libreoffice; fi
if jq ".utilities[] | select(. == 2)" "$OPTIONS_FILE" > /dev/null; then echo "Installing Synaptic..."; apt-get install -y synaptic; fi

echo "App installation complete!"
