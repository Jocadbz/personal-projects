<h1 align="center"><code>Power Mode</code></h1>
<p align="center">CLI tool for Power Profiles Daemon</p>

<p align="center">
<a href="Power Mode.svg">
  <img src="Power Mode.svg">
</a>
</p>

## Dependencies
- power-profiles-daemon
- powerprofilesctl
- notify-send
<br></br>

## Installation

Package Manager/Binary:
```bash
# From binary
wget https://github.com/Jocadbz/power-mode/releases/download/v2.0.0/powermode
sudo mv powermode /usr/bin/
```

From source:
```bash
# You need to install the V compiler
git clone https://github.com/Jocadbz/power-mode.git && cd power-mode/src/
v main.v
```

## Usage

```bash
Usage:
powermode [mode] [flags]
(Run without arguments to get the current used mode)

Modes:
- power
- balanced
- saving

Flags:
- -n - Use notify-send to send notifications
```