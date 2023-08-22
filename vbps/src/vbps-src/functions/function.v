module functions

import os

pub fn check() {
	if os.exists("${os.home_dir()}/.cache/vbps") == false {
		println("--> Fatal: void-packages not found.")
		choice := os.input("--> Do you want to clone the necessary files? [Y/n]")
		if choice == 'n' {
			exit(0)
		}
		os.mkdir("${os.home_dir()}/.cache/vbps") or { panic(err) }
		os.system("git -C ${os.home_dir()}/.cache/vbps/ clone https://github.com/void-linux/void-packages.git")
		os.system("chmod +x ${os.home_dir()}/.cache/vbps/void-packages/xbps-src")
		os.system("echo XBPS_ALLOW_RESTRICTED=yes >> ${os.home_dir()}/.cache/vbps/void-packages/etc/conf")
	}
}