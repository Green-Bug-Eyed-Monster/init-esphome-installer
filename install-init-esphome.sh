#!/bin/bash

# Script that installs the init-esphome command locally

# Copyright © 2025, green@bug-eyed.monster
# License: MIT

# curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash

FOLDER="$HOME/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/init-esphome"
SCRIPT_PATH="$FOLDER/init-esphome"

# 1. Create the folder if it doesn't exist
mkdir -p "$FOLDER"

# 2. Download the file to that folder
curl -fsSL -o "$SCRIPT_PATH" "$SCRIPT_URL"

# 3. Make it executable
chmod +x "$SCRIPT_PATH"

# 4. Add folder to PATH *only if not already in PATH*
if [[ ":$PATH:" != *":$FOLDER:"* ]]; then
    echo "Adding $FOLDER to PATH..."
    echo "export PATH=\"$FOLDER:\$PATH\"" >> ~/.bashrc
    export PATH="$FOLDER:$PATH"
fi

# 5. Reload the shell (but only if this is an interactive shell)
if [[ $- == *i* ]]; then
    source ~/.bashrc
fi

# 6. Show message

# Define some colors and styles
BOLD='\033[1m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Decorative separator
SEPARATOR="${CYAN}================================================================================${NC}"

echo -e "\n$SEPARATOR\n"
echo -e "${GREEN}${BOLD}init-esphome has been installed to ${SCRIPT_PATH}${NC}\n"

echo -e "${BOLD}Installation is complete.${NC} You can now run ${CYAN}'init-esphome'${NC} from any location," 
echo -e "to download and set up an ESPHome development environment in any chosen"
echo -e "target folder.\n"

echo -e "${BOLD}Usage:${NC} ${CYAN}init-esphome <target-folder>${NC}"
echo -e "\n$SEPARATOR\n"



