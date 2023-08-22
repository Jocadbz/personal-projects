module functions

import os
import toml


pub fn config() {
	config := toml.parse_file("${os.home_dir()}/.config/xbvs/config.toml") or { panic(err) }
	mut array := []string{}
	if config.value('repos.nonfree').bool() == true {
		array << 'void-repo-nonfree'
	} if config.value('repos.multilib').bool() == true {
		array << 'void-repo-multilib'
	} if config.value('repos.multilib_nonfree').bool() == true {
		array << 'void-repo-multilib-nonfree'
	} if config.value('repos.debug').bool() == true {
		array << 'void-repo-debug'
	}
	println("--> Evaluating packages...")
	if array.len == 0 {
		println("--> Only the base repo was enabled.")
		exit(0)
	} else {
		os.system("sudo xbps-install -S ${array.join(' ')}")
	}

}