# init-esphome-installer
## Repository for the init-esphome command and install-init-esphome.sh command installer.

<div align="center">
  <a href="https://green.bug-eyed.monster/">
    <img src="https://github.com/Green-Bug-Eyed-Monster/init-esphome-installer/blob/main/images/title-monster.png" alt="Title Image" width="55%" />
  </a>
  <p>Please visit <a href="https://green.bug-eyed.monster/">Green Bug-Eyed Monster</a>👽</p>
</div>

The `init-esphome` script creates project folders, ready-set-up to perform professional IOT node development, using the ESPHome component software framework, on Linux. It adds Visual Studio Code tasks and task buttons, which provide convenient shortcuts for common development tasks. 
All configuration is local to any project folder generated, and is thus annulled on folder erasure.

The `install-init-esphome.sh` script downloads and installs the `init-esphome` command. The `init-esphome` script's removal comprises a one file deletion.
<br>
<br>

<div align="center">
  <a href="https://green.bug-eyed.monster/">
    <img src="https://github.com/Green-Bug-Eyed-Monster/init-esphome-installer/blob/main/images/button-demo-loop.gif" alt="Demo Loop" width="80%" />
  </a>
</div>

<br>

<div align="center">
  <h3>⭐ init-esphome is featured in:</h2>
  <a href="https://www.youtube.com/watch?v=Cfvlnf9PLuQ">
    <img src="https://github.com/Green-Bug-Eyed-Monster/init-esphome-installer/blob/main/images/title-page-small.png" alt="Video Image" width="60%" />
  </a>
  <br><br>
  <p>Watch the <a href="https://www.youtube.com/watch?v=Cfvlnf9PLuQ">‘Blinky for ESPHome – using init-esphome’</a> video.</p>
</div>

### Audience
> [!WARNING]
> This is beta software under development, and may not work for you.
> 
> On these Linux releases, it appears to install and run correctly, and is able to be deleted without ill effect.
>
>- **Ubuntu 22.04 ✓**
>- **Ubuntu 24.04 ✓**
>- **\<reports-please\> ✓**  - via 👽 https://green.bug-eyed.monster/
>
>On these Linux releases, it fails any of the above.
>
>- **Ubuntu 25.04 ⨯**    - _Error: The repository 'https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu plucky Release' does not have a Release file._ _Ubuntu 25.05 (codename: plucky) is too new, and the Deadsnakes PPA has not added support for it yet._ _Deadsnakes usually supports LTS releases like 22.05/24.04 (**Wait for Ubuntu 26.04 LTS**)._
>- **\<reports-please\> ⨯**  - via 👽 https://green.bug-eyed.monster/
>

<br>

### Prerequisites
The version of Python3 needed to run ESPHome may change over time. Check the installation guide to see which specific Python3 version you'll need to run ESPHome. 
([https://esphome.io/guides/installing_esphome#linux)](https://esphome.io/guides/installing_esphome#linux)) 

At the time of writing, ESPHome required **Python3.11**.

Project folders created with this utility, contain an isolated Python3 virtual environment, matched to suit the requirements of ESPHome. This is distinct from any other system-wide Python3 installation. The prototype Python3 version must first be installed, before the isolated 
Python3 virtual environment can later be automatically created from it. The required version of Python3 is installed, yet not made active. System-wide Python3 configurations are thus left safely unaltered.

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

To install the `init-esphome` command script in your ~/.local/bin folder, possibly create the directory, and add it to your path if it's not found there, just run the following shell command.
```
curl -fsSL https://raw.githubusercontent.com/Green-Bug-Eyed-Monster/init-esphome-installer/refs/heads/main/install-init-esphome.sh | bash
```
> [!NOTE]
> This is fully open-source software, made freely available for inspection.
> If you have security concerns, please review both the [`install-init-esphome.sh`](./install-init-esphome.sh) installer and the [`init-esphome`](./init-esphome) development environment setup script before running the installer, along with your copy of ~/.local/bin/[`init-esphome`](./init-esphome) after it's installed.

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

[^1]: Any first-run-downloaded Visual Studio Code extension recommendation has lasting, global effect. Conversely, all VS Code customisation is scoped to the project folder. i.e. When the project folder is erased, all customisation is lost.
[^2]: The ~/.local/bin path possibly set during installation, isn't removed in this step, as it may still be in use. The path ~/.local/bin refers to a folder commonly used for user-specific executable files, on many contemporary Linux distributions.

