# init-esphome-installer
## Repository for init-esphome command installer and init-esphome command for Linux.

The init-esphome script creates project folders, already ready set-up to accomplish professional IOT node development, using the ESPHome component software framework, in a Visual Studio Code environment.

### Prerequisites

Check that your Linux distribution has Python3 version 3.10+.
```
python --version
  Python 3.10.12  ✓
```

Add the repository and install Microsoft Visual Studio Code, if you don't already have it installed.
```
sudo apt update
sudo apt install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
```

### Installation


To install the init-esphome command script in your ~/.local/bin folder, creating the directory and adding it to your path if it doesn't already exist, just run the following shell command.
```
curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash
```
### Use
You can then run the init-esphome script from any location, to download and set up an ESPHome development environment in any chosen target folder on Linux. It will create the target folder if it doesn't already exist, then populate it with all the files required. 

**Usage:** `init-esphome <target-folder>`

---

Please visit the [Green Bug-Eyed Monster](https://green.bug-eyed.monster/) website.

![Picture of a Green Bug-Eyed Monster.](/images/GBEM.jpg)

