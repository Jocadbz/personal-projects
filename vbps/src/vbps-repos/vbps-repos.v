module main

import functions
import os

fn main() {
	functions.check()

	if '--help' in os.args[1..] {
		println('VBPS-REPOS VERSION 1.0.0\n\nBUGS: https://github.com/jocadbz/vbps')
		exit(0)
	}

	if 'edit' in os.args[1..] {
		editor := os.getenv("EDITOR")
		if editor.len == 0 {
			println("Failed to get your default editor.")
			exit(1)
		} else {
			os.system("${editor} ${os.home_dir()}/.config/vbps/config.toml")
			exit(0)
		}
	}
	functions.config()
}
