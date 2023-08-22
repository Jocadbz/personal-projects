module functions

import os
import crypto.md5
import toml
import net.http as net

pub fn update() {
	packages := os.ls('${os.home_dir()}/.cache/vaur/clone/') or { panic(err) }
	mut array := []thread{}
	
	for pkg in packages {
		array << spawn finish_update(pkg)
	}
	
	array.wait()
}

fn finish_update(pkg string) {
	if os.execute("sudo pacman -Qi ${pkg}").exit_code == 0 {
		net.download_file("https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkg}",
						  "${os.home_dir()}/.cache/vaur/clone/${pkg}/PKGBUILD") or { panic(err) }
		pkgbuild := os.read_file('${os.home_dir()}/.cache/vaur/clone/${pkg}/PKGBUILD') or {
			panic(err)
		}
		sum := md5.hexhash(pkgbuild)
		tomlsum := toml.parse_file('${os.home_dir()}/.cache/vaur/md5sum/${pkg}.toml') or { panic(err) }
		if sum == tomlsum.value('md5sum').string() {
			// println("No updates for package ${pkg}")
		} else {
			println("Updating package ${pkg}")
			os.execute('git -C ${os.home_dir()}/.cache/vaur/clone/${pkg} pull')
			os.chdir("${os.home_dir()}/.cache/vaur/clone/${pkg}") or { panic(err) }
			os.system("makepkg --syncdeps --install")
			os.write_file("${os.home_dir()}/.cache/vaur/md5sum/${pkg}.toml", "md5sum = '${md5.hexhash(pkgbuild)}'") or { panic(err) }
		}
	}
	else {
		// Let's do nothing here
	}
}