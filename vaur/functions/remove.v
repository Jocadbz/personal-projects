module functions

import os

pub fn remove(package []string) {
	mut array := []string{}
	for pkg in package {
		if os.exists("${os.home_dir()}/.cache/vaur/clone/${pkg}") == true {
			os.system("rm -rf ${os.home_dir()}/.cache/vaur/clone/${pkg}")
		}
		if os.exists("${os.home_dir()}/.cache/vaur/md5sum/${pkg}.toml") == true {
			os.rm("${os.home_dir()}/.cache/vaur/md5sum/${pkg}.toml") or { panic(err) }
		}
		find_pkg := os.execute("pacman -Qi ${pkg}")
		if find_pkg.exit_code == 0 {
			array << pkg
		} else {
			println("\033[1m\033[31m[*] Error: ${pkg} not installed. Skipping...\033[0m")
		}
		if array.len == 0 {
			// Dummy skip
		} else {
			os.system("sudo pacman -R ${array.join(' ')}")
		}
	}
}
