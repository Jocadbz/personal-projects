module main

import os

fn main() {
	services_available := os.ls("/etc/sv/") or {
		println("--> Error reading the services available")
		println("Are you sure /etc/sv/ exists?")
		exit(1)
	}
	services_running := os.ls("/var/service/") or {
		println("--> Error reading the services directory")
		println("Are you sure /var/service exists?")
		exit(1)
	}

	if os.args[1..].len == 0 {
		println("--> ERROR: No arguments provided")
		exit(1)
	}

	if '--help' in os.args[1..] {
		println('VBPS-RUNIT VERSION 1.0.0\n\nBUGS: https://github.com/jocadbz/vbps')
		exit(0)
	}

	match os.args[1] {
		'enable', 'up' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(1)
			}
			if os.args[2] !in services_available {
				println("-- Error: Service not found")
				exit(1)
			}
			os.system("sudo ln -s /etc/sv/${os.args[2]} /var/service/")
		}
		'disable', 'down' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(1)
			}
			if os.args[2] !in services_running {
				println("-- Error: Service not found")
				exit(1)
			}
			os.system("sudo rm /var/service/${os.args[2]}")
		}
		'status' {
			os.system("sudo sv status /var/service/*")
		}
		else {
			println("--> ERROR: Unrecognized argument. Refer to vbps --help.")
			exit(1)
		}
	}
}