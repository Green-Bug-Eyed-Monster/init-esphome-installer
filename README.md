# init-esphome-installer
## Repository for the init-esphome command and install-init-esphome.sh command installer.

The `init-esphome` script creates project folders, ready set-up to perform professional IOT node development, using the ESPHome component software framework, inside a tailored Visual Studio Code environment.
The `install-init-esphome.sh` script downloads and installs the `init-esphome` command, on Debian-style Linux systems.

### Prerequisites

Check that your Linux distribution has Python3 version 3.10 or later.
```
python --version
  Python 3.10.12  ✓
```

If you don't already have Microsoft Visual Studio Code installed, then add the repository and install it.
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


To install the `init-esphome` command script in your ~/.local/bin folder, creating the directory and adding it to your path if it doesn't already exist, just run the following shell command.
```
curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash
```
> [!NOTE]
> If you have any security concerns, please review the [`install-init-esphome.sh`](./install-init-esphome.sh) installation script, as well as the [`init-esphome`](./init-esphome) development environment creation script itself, before invoking the installer.

### Use
After installation, you may run the `init-esphome` script from any location, to download and set up an ESPHome development environment, in any chosen target folder. It will create the target folder if it doesn't already exist, then populate it with all the files required to perform professional IOT node development, including the ESPHome component software framework, and a tailored Visual Studio Code environment. Any downloaded Visual Studio Code extension suggestion has lasting, global effect. Conversely, all VS Code customisation is working folder scoped. i.e. When the working folder is erased, all customisation is lost.

**Usage:** `init-esphome <target-folder>`

---

Please visit the [Green Bug-Eyed Monster](https://green.bug-eyed.monster/) website.

![Picture of a Green Bug-Eyed Monster.](/images/GBEM.jpg)

