#!/bin/bash

# Script that installs init-esphome locally

# curl -fsSL https://green.bug-eyed.monster/install-init-esphome.sh | bash

FOLDER="$HOME/.local/bin"
SCRIPT_URL="https://green.bug-eyed.monster/init-esphome"
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
echo "init-esphome has been installed to $SCRIPT_PATH\n"
echo "Installation complete. You can now run 'init-esphome' anywhere,"
echo "to download and configure the ESPHome development environment,"
echo "placing it within the specified target folder.\n"
echo "Usage: init-esphome <target-folder>\n"



