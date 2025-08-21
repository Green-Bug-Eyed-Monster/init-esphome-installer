# init-esphome-installer
## Repository for the init-esphome command and install-init-esphome.sh command installer.

The `init-esphome` script creates project folders, ready-set-up to perform professional IOT node development, using the ESPHome component software framework on Linux. It adds Visual Studio Code tasks and task buttons, which provide convenient shortcuts for common development tasks. 
All configuration is local to any project folder generated, and is thus annulled on folder erasure.

The `install-init-esphome.sh` script downloads and installs the `init-esphome` command. It's removal is a one file deletion.
<br>
<br>

![Button demo loop.](/images/button-demo-loop.gif)
<br>

### ⭐ init-esphome is featured in:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;‘Blinky for ESPHome – using init-esphome’

[![Watch the video](https://github.com/Green-Bug-Eyed-Monster/init-esphome-installer/blob/main/images/title-page-small.png)](https://www.youtube.com/watch?v=Cfvlnf9PLuQ)
<br>

### Prerequisites
The version of Python needed to run ESPHome may change over time. Check the installation guide to see which specific Python version you'll need to run ESPHome. 
([https://esphome.io/guides/installing_esphome#linux)](https://esphome.io/guides/installing_esphome#linux)) 

At the time of writing, ESPHome required Python version 3.11.
```
python --version
  Python 3.9.18     ✗ 
```
```
python3 --version
  Python 3.10.12    ✗ 
```
As above, on some systems, the `python` and `python3` commands may not point to the version of Python required to run ESPHome. These commands are often reserved for legacy scripts' or system utilities' use, respectively. To avoid interfering with them, `init-esphome` uses an isolated Python virtual environment within target project folders, running ESPHome via python3.11. This approach sidesteps any conflicts with system-wide Python links or dependencies. The only requirement is that Python 3.11 is installed...it doesn’t need to be linked globally.

If Python 3.11 is already installed, it’s likely that python3.11-venv is not. To ensure both are correctly set up, you can safely re-install or update them using your package manager. Existing installations will be refreshed, and missing components will be added.
<br>
<br>

**Add or update of python3.11 and python3.11-venv, by idempotent overwrite sequence:**

First add the software-properties-common package for the add-apt-repository command.
```
sudo apt update
sudo apt install software-properties-common
```
Then add the deadsnakes PPA (Personal Package Archive), and update local package lists.
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
```
Install Python 3.11 and it's isolated virtual environment module.
```
sudo apt install python3.11 python3.11-venv
```
You now have all the Python 3.11 prerequisites.
<br>
<br>

**Install Microsoft Visual Studio Code**

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
<br>

### Installation

To install the `init-esphome` command script in your ~/.local/bin folder, creating the directory and adding it to your path if it does not already exist, just run the following shell command.
> [!WARNING]
> This is beta software under development, and will likely not work for you.
> Please come back when this notice has been removed.
```
curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash
```
> [!NOTE]
> This is fully open-source software, freely available for inspection.
> If you have security concerns, please review both the [`install-init-esphome.sh`](./install-init-esphome.sh) installer and the [`init-esphome`](./init-esphome) development environment setup script, before running the installer.
<br>

### Use
After installation, you may run the `init-esphome` script from any location, to download and set up an ESPHome development environment (~150MB), in any chosen target folder. 

It will create the target folder if it does not already exist, then populate it with all the files required to perform professional IOT node development, including the ESPHome component software framework, and a tailored Visual Studio Code environment. 

**To initialise a folder for ESPHome development**—creating it if it doesn't already exist—use the following command with the absolute or relative path to the target folder:
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

