module main

import functions
import os

fn main() {
	functions.check()

	if os.args[1..].len == 0 {
		println("--> ERROR: No arguments provided")
		exit(1)
	}

	if '--help' in os.args[1..] {
		println("VBPS-SRC VERSION 1.0.0\n\nBUGS: https://github.com/jocadbz/vbps")
		exit(0)
	}

	match os.args[1] {
		'build', 'b' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(1)
			}
			os.chdir("${os.home_dir()}/.cache/vbps/void-packages/") or { panic(err) }
			os.system("${os.home_dir()}/.cache/vbps/void-packages/xbps-src pkg ${os.args[2]}")
		}
		'install-nonfree', 'in' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(1)
			}
			os.chdir("${os.home_dir()}/.cache/vbps/void-packages/") or { panic(err) }
			os.system("sudo xbps-install --repository ${os.home_dir()}/.cache/vbps/void-packages/hostdir/binpkgs/nonfree ${os.args[2..]}")
		}
		'install', 'i' {
			if os.args[2..].len == 0 {
				println("--> ERROR: No arguments provided")
				exit(1)
			}
			os.chdir("${os.home_dir()}/.cache/vbps/void-packages/") or { panic(err) }
			os.system("sudo xbps-install --repository ${os.home_dir()}/.cache/vbps/void-packages/hostdir/binpkgs/ ${os.args[2..]}")
		}
		'update', 'u' {
			os.system("git -C ${os.home_dir()}/.cache/vbps/void-packages pull")
		}
		else {
			println("--> ERROR: Unrecognized argument. Refer to vbps --help.")
			exit(1)
		}
	}
}