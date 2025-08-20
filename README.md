# init-esphome-installer
## Repository for the init-esphome command and install-init-esphome.sh command installer.

The `init-esphome` script creates project folders, ready-set-up to perform professional IOT node development, using the ESPHome component software framework on Linux. It adds Visual Studio Code tasks and task buttons, which provide convenient shortcuts for common development tasks. 
All configuration is local to any project folder generated, and is thus annulled on folder erasure.

The `install-init-esphome.sh` script downloads and installs the `init-esphome` command.
<br>
<br>

![Button demo loop.](/images/button-demo-loop.gif)

### ⭐ init-esphome is featured in: ‘Blinky for ESPHome – using init-esphome’.

[![Watch the video](https://github.com/Green-Bug-Eyed-Monster/init-esphome-installer/blob/main/images/title-page-small.png)](https://www.youtube.com/watch?v=Cfvlnf9PLuQ)

### Prerequisites
The version of Python needed to run ESPHome may change over time. Check the installation guide to see which specific Python version you'll need to run ESPHome. 
([https://esphome.io/guides/installing_esphome#linux)](https://esphome.io/guides/installing_esphome#linux)) 

At the time of writing, ESPHome required Python version 3.11.
```
python3 --version
  Python 3.9.18    ✗ 
```
<br>

**Update Python if necessary...**

Add the software-properties-common package for the add-apt-repository command,
if not already installed.
```
sudo apt update
sudo apt install software-properties-common
```
Add the deadsnakes PPA (Personal Package Archive), and update local package lists.
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
```
Check current system's available package lists for all available python3 versions.
```
apt list -a 2>/dev/null | grep -E '^python3\.[0-9]+/' | cut -d/ -f1 | sort -Vu
```
Add required Python release as an alternative version of python3.
```
sudo apt install python3.11
```
Make it selectable via the update-alternatives system.
```
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
```
To select the Python version you want to use (e.g., Python 3.11), run:
```
sudo update-alternatives --config python3
```
You’ll see an output like this:
```
There are 4 choices for the alternative python3 (providing /usr/bin/python3).

  Selection    Path                 Priority   Status
------------------------------------------------------------
  0            /usr/bin/python3.11   1         auto mode
  1            /usr/bin/python3.10   1         manual mode
  2            /usr/bin/python3.11   1         manual mode
  3            /usr/bin/python3.14   1         manual mode
* 4            /usr/bin/python3.9    1         manual mode

```
Then type the number corresponding to /usr/bin/python3.10 and press Enter.
```
2
```
This selects which Python version runs when you type `python3`.

Again check that your Linux distribution has the requisite Python3 version installed, as well selected in the update-alternatives system.
```
python3 --version
Python 3.11.11   ✓
```
<br>

**Install Microsoft Visual Studio Code if necessary...**

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
```
curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash
```
> [!NOTE]
> These are open-source resources, fully available for inspection.
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

