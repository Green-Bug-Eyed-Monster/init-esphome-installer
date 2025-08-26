# init-esphome-installer
## Repository for the init-esphome command and install-init-esphome.sh command installer.

The `init-esphome` script creates project folders, ready-set-up to perform professional IOT node development, using the ESPHome component software framework, on Linux. It adds Visual Studio Code tasks and task buttons, which provide convenient shortcuts for common development tasks. 
All configuration is local to any project folder generated, and is thus annulled on folder erasure.

The `install-init-esphome.sh` script downloads and installs the `init-esphome` command. The `init-esphome` script's removal is a one file deletion.
<br>
<br>

![Button demo loop.](/images/button-demo-loop.gif)
<br>

### ⭐ init-esphome is featured in:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;‘Blinky for ESPHome – using init-esphome’

[![Watch the video](https://github.com/Green-Bug-Eyed-Monster/init-esphome-installer/blob/main/images/title-page-small.png)](https://www.youtube.com/watch?v=Cfvlnf9PLuQ)
<br>

### Prerequisites
The version of Python3 needed to run ESPHome may change over time. Check the installation guide to see which specific Python3 version you'll need to run ESPHome. 
([https://esphome.io/guides/installing_esphome#linux)](https://esphome.io/guides/installing_esphome#linux)) 

At the time of writing, ESPHome required Python3 version 3.11.

Project folders created with this utility, contain an isolated Python3 virtual environment, matched to suit the requirements of ESPHome. This is distinct from any other system-wide Python3 installation. The prototype Python3 version must first be installed, before the isolated 
Python3 virtual environment can later be created from it. The required version of Python3 is installed, but not made active. System-wide Python3 configurations are thus left safely unaltered.

**Add python3.11-venv and update/install python3.11**

```
sudo apt update -y
sudo apt install -y software-properties-common
sudo add-apt-repository -y universe
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update -y
sudo apt install -y python3.11 python3-venv python3.11-venv python3-pip
sudo apt install -y git curl
```
You now have all the Python3.11 prerequisites.
<br>
<br>

**Install Microsoft Visual Studio Code**

If you don't already have Microsoft Visual Studio Code installed, then add the repository and install it.
```
sudo apt update -y
sudo apt install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm packages.microsoft.gpg
sudo apt update -y
sudo apt install code -y
```
> [!NOTE]
> This works on Ubuntu 22.04, but may yield a broken installation on version 24.04.
> I skipped the heartache, and just used the App Center to install VS Code on Ubuntu 24.04.
<br>

**Add your username to the dialout group, to gain /dev/ttyX (USB/Serial) device access for flashing.**
```
sudo usermod -a -G dialout <your_username>
```
To effect this change, power-cycle any USB/Serial peripherals, then do a full session logout. You must either reboot, or log right out of Linux, then log back in again.
<br>
<br>

### Installation

To install the `init-esphome` command script in your ~/.local/bin folder, creating the directory and adding it to your path if it does not already exist, just run the following shell command.
> [!WARNING]
> This is beta software under development, and may not work for you. It has been developed and tested on Ubuntu versions 22.04 and 24.04. On these, it appears to install, run well, and be able to be deleted without ill effect.
```
curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash
```
> [!NOTE]
> This is fully open-source software, made freely available for inspection.
> If you have security concerns, please review both the [`install-init-esphome.sh`](./install-init-esphome.sh) installer and the [`init-esphome`](./init-esphome) development environment setup script before running the installer, along with your copy of init-esphome after it's installed.
<br>

### Use
After installation, you may run the `init-esphome` script from any location, to download and set up an ESPHome development environment, in any chosen target folder. 

It will create the target folder if it does not already exist, then populate it with all the files required to perform professional IOT node development, including the ESPHome component software framework, and a tailored Visual Studio Code environment. 

**To initialise a folder for ESPHome development**—creating it if it doesn't already exist—use the following command, along with the path to the target folder, be it absolute or relative:
```
init-esphome <target-folder>
```
<br>

### Removal
To remove the `init-esphome` command script from your ~/.local/bin folder completely, just run the following shell command.[^1]
```
rm ~/.local/bin/init-esphome
```
The path remains unaltered.[^2]
<br>

---

Please visit [Green Bug-Eyed Monster](https://green.bug-eyed.monster/) 👽

[^1]: Any first-run-downloaded Visual Studio Code extension recommendation has lasting, global effect. Conversely, all VS Code customisation is scoped to the working folder. i.e. When the working folder is erased, all customisation is lost.
[^2]: The ~/.local/bin path possibly set during installation, isn't removed in this step, as it may still be in use. The path ~/.local/bin refers to a folder commonly used for user-specific executable files, on many later Linux distributions.

