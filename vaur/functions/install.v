module functions

import os
import git
import crypto.md5
import statusbar
import progressbar
import time

pub fn install(package []string) {
	mut aur_array := []string{}
	array := os.read_lines('${os.home_dir()}/.cache/vaur/packages') or { panic(err) }
	mut s := statusbar.new_statusbar('\033[1m[*] Processing packages...\033[0m')
	go s.start()
	time.sleep(2)
	for pkg in package {
		pacman_command := os.execute("pacman -Si ${pkg}")
		if pacman_command.exit_code == 0 {
			println("\n\033[1m\033[31m[*] Error: ${pkg} is not a AUR package\033[0m")
			exit(1)
		} else {
			if pkg !in array {
				println('')
				println('\033[1m\033[31m[*] Error: Target not found: ${pkg}\033[0m')
				exit(0)
			} else {
				aur_array << pkg
			}
		}
	}
	s.finish()
	println("")
	for pkg in aur_array {
		println("\033[1m==> \033[94maur\033[0m\033[1m/${pkg}\033[0m")
	}

	// os.input("Press any key to continue: ")
	println('')
	// println('\033[1m[*] GIT starting...\033[0m')
	install_operations(package)
}

pub fn install_operations(package []string) {
	mut bar := progressbar.Progressbar{}
	if package.len == 0 {
		// Dummy skip
	} else {
		bar.new('\033[1m[*] Cloning PKGBUILDS...\033[0m', package.len)
		for pkg in package {
			if os.execute("sudo pacman -Qi ${pkg}").exit_code == 0 {
				println("\033[1m\033[31m[*] Error: Package ${pkg} already installed. Skipping...\033[0m")
				exit(1)
			} else {
				git.clone("${os.home_dir()}/.cache/vaur/clone", "https://aur.archlinux.org/${pkg}.git")
				bar.increment()
			}
		}
		bar.finish()
		for pkgi in package {
			println('\033[1m[*] ${pkgi}/PKGBUILD\033[0m')
			pkgbuild := os.read_file("${os.home_dir()}/.cache/vaur/clone/${pkgi}/PKGBUILD") or {
				println('\033[1m\033[31m[*] Error: Package ${pkgi} apparently does not have a PKGBUILD file.\033[0m')
				exit(1)
			}
			println(pkgbuild)
			println("")
		}
		os.input("Press any key to continue or Ctrl + C to exit: ")
		for pkgi in package {
			os.chdir('${os.home_dir()}/.cache/vaur/clone/${pkgi}') or { panic(err) }
			os.system('makepkg --syncdeps --install')
			os.create('${os.home_dir()}/.cache/vaur/md5sum/${pkgi}.toml') or { panic(err) }

			pkgbuild := os.read_file('${os.home_dir()}/.cache/vaur/clone/${pkgi}/PKGBUILD') or { panic(err) }
			sum := md5.hexhash(pkgbuild)
			os.write_file('${os.home_dir()}/.cache/vaur/md5sum/${pkgi}.toml', "md5sum = '${sum}'") or { panic(err) }
		}
	}
}
