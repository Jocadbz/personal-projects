module main

import os
import functions

fn main() {
	functions.check()
	if os.args[1..].len == 0 {
		println("[*] Error - No Argument provided")
		println("Run with '--help' to display current options")
		exit(1)
	}
	if '--updb' in os.args[1..] {
		functions.update_database()
		exit(0)
	}
	if '--gendb' in os.args[1..] {
		functions.gendb()
		exit(0)
	}
	// This is the worst hack i've ever wrote
	// It basically serves to find the position of the element in the array, very useful
	if 'install' in os.args[1..] {
		for i, args in os.args[0..] {
			if args == 'install' {
				num := i+1
				arg := os.args[num..]
				functions.install(arg)
			}
		}
		exit(0)
	}
	if 'update' in os.args[1..] {
		functions.update()
		exit(0)
	}

	if 'remove' in os.args[1..] {
		for i, args in os.args[0..] {
			if args == 'remove' {
				num := i+1
				arg := os.args[num..]
				functions.remove(arg)
			}
		}
		exit(0)
	}

	if 'search' in os.args[1..] {
		for i, args in os.args[0..] {
			if args == 'search' {
				num := i+1
				arg := os.args[num..]
				functions.query(arg)
			}
		}
		exit(0)
	}	

	if '--help' in os.args[1..] {
		println("VAUR - 2023
Jocadbz - MIT License

Usage: vaur [flags] [commands]

Flags:
--updb - Updates the database of AUR packages
--gendb - Generates the folders for tracking updates

Commands:
install [Packages...] - Install(s) AUR packages
update - Updates AUR's PKGBUILDS, and if a change is detected, install them")
	} else {
		println("Unrecognized Argument.")
	}
}
