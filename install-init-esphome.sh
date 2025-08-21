#!/bin/bash 

# Script that installs the init-esphome command locally
# Copyright © 2025, green@bug-eyed.monster
# License: MIT

FOLDER="$HOME/.local/bin"
SCRIPT_URL="https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/init-esphome"
SCRIPT_NAME="init-esphome"
SCRIPT_PATH="$FOLDER/$SCRIPT_NAME"
BASHRC="$HOME/.bashrc"
PROFILE="$HOME/.profile"
ENV_CONF_DIR="$HOME/.config/environment.d"
ENV_CONF_FILE="$ENV_CONF_DIR/10-local-bin.conf"

# Normalize FOLDER path
FOLDER_REALPATH="$(realpath -m "$FOLDER")"

# Function to test if path is already in PATH
path_in_path() {
    echo "$PATH" | tr ':' '\n' | grep -Fxq "$FOLDER_REALPATH"
}

# 1. Ensure ~/.local/bin exists
mkdir -p "$FOLDER_REALPATH"

# Download the file to that folder
curl -fsSL -o "$FOLDER_REALPATH/$SCRIPT_NAME" "$SCRIPT_URL"

# Make it executable
chmod +x "$FOLDER_REALPATH/$SCRIPT_NAME"

# 2. Add to .bashrc if not present
if ! grep -q "$FOLDER_REALPATH" "$BASHRC" 2>/dev/null; then
    echo "export PATH=\"$FOLDER_REALPATH:\$PATH\"" >> "$BASHRC"
    echo "✅ Added $FOLDER_REALPATH to ~/.bashrc"
fi

# 3. Add to .profile if not present
if ! grep -q "$FOLDER_REALPATH" "$PROFILE" 2>/dev/null; then
    echo "export PATH=\"$FOLDER_REALPATH:\$PATH\"" >> "$PROFILE"
    echo "✅ Added $FOLDER_REALPATH to ~/.profile"
fi

# 4. Add to ~/.config/environment.d for GUI sessions (Ubuntu 24.04+)
mkdir -p "$ENV_CONF_DIR"
if ! grep -q "$FOLDER_REALPATH" "$ENV_CONF_FILE" 2>/dev/null; then
    echo "PATH=$FOLDER_REALPATH:\$PATH" > "$ENV_CONF_FILE"
    echo "✅ Created $ENV_CONF_FILE for persistent GUI support"
    echo "ℹ️ You may need to reboot or run: systemctl --user import-environment"
fi

# 5. Make effective immediately in current shell if possible
if path_in_path; then
    echo "✅ $FOLDER_REALPATH is already in PATH"
else
    export PATH="$FOLDER_REALPATH:$PATH"
    echo "✅ Temporarily updated PATH in this shell"
fi

# 6. Inform the user if manual action is needed
if [[ $- == *i* ]]; then
    # Interactive shell — source updated files
    source "$BASHRC"
    echo "✅ Reloaded ~/.bashrc"
else
    echo ""
    echo "⚠️ This shell is non-interactive."
    echo "👉 To apply the changes now, run: source ~/.bashrc"
    echo "🔁 Or open a new terminal / reboot."
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
echo -e "  ${SCRIPT_PATH}"
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




