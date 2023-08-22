// Function
module function

import os

// Performance mode
pub fn performance() {
	println('- [x] Power Mode
- [ ] Balanced Mode
- [ ] Power-Saving Mode

Power-mode selected')
}

// Balanced mode
pub fn balanced() {
	println('- [ ] Power Mode
- [x] Balanced Mode
- [ ] Power-Saving Mode

Balanced mode selected')
}

// Saving mode
pub fn power_saver() {
	println('- [ ] Power Mode
- [ ] Balanced Mode
- [x] Power-Saving Mode

Power-saving mode selected')
}

pub fn get_mode() {
	mode := os.execute('powerprofilesctl get')
	println('Your current mode is: ${mode.output}')
}

pub fn notify(mode string) {
	os.system("notify-send 'Power Notification' 'Your device is on ${mode} mode' -i battery -a Powermode")
}

pub fn help() {
	println('Power Mode
Version 2.1.0
Jocadbz, 2022

Usage:
powermode [mode] [flags]
(Run without arguments to get the current used mode)

Modes:
- power
- balanced
- saving

Flags:
- -n - Use notify-send to send notifications')
}
