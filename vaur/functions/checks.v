module functions

import os

pub fn check() {
	if os.exists('${os.home_dir()}/.cache/vaur') == false {
		os.mkdir('${os.home_dir()}/.cache/vaur') or { panic(err) }
		os.mkdir('${os.home_dir()}/.cache/vaur/clone') or { panic(err) }
		os.mkdir('${os.home_dir()}/.cache/vaur/md5sum') or {}
	}
}