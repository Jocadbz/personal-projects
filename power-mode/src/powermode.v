module main

import os
import function

fn main() {
	command := os.args.clone()
	if command[1..].len == 0 {
		function.get_mode()
		exit(0)
	}
	if 'power' in command {
		os.system('powerprofilesctl set performance')
		if '-n' in command {
			function.notify('performance')
		} else {
			function.performance()
		}
		exit(0)
	}
	if 'balanced' in command {
		os.system('powerprofilesctl set balanced')
		if '-n' in command {
			function.notify('balanced')
		} else {
			function.balanced()
		}
		exit(0)
	}
	if 'saving' in command {
		os.system('powerprofilesctl set power-saver')
		if '-n' in command {
			function.notify('performance')
		} else {
			function.power_saver()
		}
		exit(0)
	}
	if 'help' in command {
		function.help()
		exit(0)
	}
}
