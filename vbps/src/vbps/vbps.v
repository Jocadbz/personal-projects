module main

import os
import toml
import func

fn main() {
	func.check()

	doc := toml.parse_file("${os.home_dir()}/.config/vbps/config.toml") or { panic(err) }
	auth := doc.value('wrapper.auth').string()
	xbpsi := doc.value('wrapper.xbps_install_loc').string()
	xbpsr := doc.value('wrapper.xbps_remove_loc').string()
	xbpsq := doc.value('wrapper.xbps_query_loc').string()


	if os.args[1..].len == 0 {
		println("--> ERROR: No arguments provided")
		exit(1)
	}

	if '--help' in os.args[1..] {
		println("VBPS v1.1.0 © Jocadbz, VBPS-REPOS v1.0.1 © Jocadbz, VBPS-RUNIT v1.0.0 © Jocadbz, VBPS-SRC v1.0.0 © Jocadbz
GPL3-0 License

 - VBPS
The main wrapper for XBPS
Usage: vbps [command] [arguments]

Commands:
install, i - Installs a package
update, u - Updates the system, and optionally installs a package within the same operation
remove, r - Remove a package
repo-search, rs - Searchs for a package on the remote repository
local-search, ls - Searchs for a package within the packages installed on your system

- VBPS-REPOS
Utility to manage Void repository
Usage: vbps-repos [command]

Commands:
edit - Open EDITOR to edit the config file.

VBPS-REPOS will check for the repos that were enabled in your config file, and install them.


- VBPS-RUNIT
Utility to manage runit services
Usage: vbps-runit [command] [arguments]

Commands:
enable, up - Enable a service
disable, down - Disable a service
status - Show the current services PIDs and statuses.


- VBPS-SRC
Utility to build and install nonfree packages from void-packages
Usage:
vbps-src [command] [arguments]

Commands:
build, b - Builds a package
install, i - Installs a package
install-nonfree, in - Installs a package with a nonfree license
update, u - Updates the repository")
		exit(0)
	}

	// Implement handler
	match os.args[1] {
		'install', 'i' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(1)
			}
			os.system("${auth} ${xbpsi} -S ${os.args[2..].join(' ')}")
		}
		'update', 'u' {
			if os.args[2..].len == 0 {
				os.system("${auth} ${xbpsi} -Su")
				exit(0)
			}
			os.system("${auth} ${xbpsi} -Su ${os.args[2..].join(' ')}")
		}
		'remove', 'r' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(0)
			}
			os.system("${auth} ${xbpsr} ${os.args[2..].join(' ')}")
		}
		'repo-search', 'rs' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(0)
			}
			os.system("${auth} ${xbpsq} -Rs ${os.args[2..].join(' ')}")
		}
		'local-search', 'ls' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(0)
			}
			os.system("${auth} ${xbpsq} -s ${os.args[2..].join(' ')}")
		}
		else {
			println("--> ERROR: Unrecognized argument. Refer to vbps --help.")
			exit(1)
		}
	}
}
