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
BRIGHT_GREEN='\033[1;32m'
BRIGHT_RED='\033[1;31m'
BRIGHT_YELLOW='\033[1;33m'
LIME_GREEN='\033[38;5;10m' 
BRIGHT_YELLOW='\033[38;5;11m'
NC='\033[0m' # No Color

# Decorative separator
SEPARATOR="${BRIGHT_YELLOW}==============================================================================${NC}"

echo -e "\n$SEPARATOR\n\n"
echo -e "  ${BOLD}Installation is complete.${NC}\n"
echo -e "  Your ${LIME_GREEN}init-esphome${NC} command has been installed to:"
echo -e "    ${SCRIPT_PATH}"
echo -e "  To apply changes, run: source ~/.bashrc or open a new terminal / reboot."
echo -e
echo -e "  You can now run the ${LIME_GREEN}init-esphome${NC} command from anywhere. It will:"
echo -e
echo -e "    - Create the target folder (if it doesn’t already exist)"
echo -e "    - Set up everything needed for professional IoT development, including:"
echo -e "        - The ESPHome framework"
echo -e "        - A pre-configured Visual Studio Code environment"
echo -e
echo -e "  ${BOLD}Usage:${NC} ${LIME_GREEN}init-esphome${NC} <target-folder>"
echo -e "\n   👽\n"
echo -e "\n$SEPARATOR\n"







