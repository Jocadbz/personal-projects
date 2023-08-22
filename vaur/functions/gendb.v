module functions

import os
import git
import crypto.md5
import progressbar

pub fn gendb() {
	mut p := progressbar.Progressbar{}
	installed_packages := os.execute("pacman -Qq")
	os.create("${os.home_dir()}/.cache/vaur/installed_packages") or { panic(err) }
	os.write_file("${os.home_dir()}/.cache/vaur/installed_packages", installed_packages.output) or { panic(err) }


	installed_pkgs := os.read_lines("${os.home_dir()}/.cache/vaur/installed_packages") or { panic(err) }
	aur_packages := os.read_lines("${os.home_dir()}/.cache/vaur/packages") or { panic(err) }
	p.new("\033[1m[*] Processing packages...\033[0m", installed_pkgs.len)
	mut array := []thread{}
	for pkg in installed_pkgs {
		array << spawn finish_install(pkg, aur_packages)
		p.increment()
	}
	array.wait()
	p.finish()
}

fn finish_install(pkg string, aur_packages []string) {
	if pkg in aur_packages {
		check := os.execute("pacman -Si ${pkg}")
		if check.exit_code == 1 {
			if os.exists("${os.home_dir()}/.cache/vaur/clone/${pkg}") == false {
				git.clone("${os.home_dir()}/.cache/vaur/clone/", "https://aur.archlinux.org/${pkg}.git")
				pkgbuild := os.read_file('${os.home_dir()}/.cache/vaur/clone/${pkg}/PKGBUILD') or { panic(err) }
				sum := md5.hexhash(pkgbuild)
				os.write_file('${os.home_dir()}/.cache/vaur/md5sum/${pkg}.toml', "md5sum = '${sum}'") or { panic(err) }
			}	
		}
	}
}