module functions

import os
import net.http as net

pub fn update_database() {
	if os.exists('${os.home_dir()}/.cache/vaur/packages') == true {
		os.rm('${os.home_dir()}/.cache/vaur/packages') or { panic(err) }
	}
	net.download_file('https://aur.archlinux.org/packages.gz', '${os.home_dir()}/.cache/vaur/packages.gz') or {
		println('[*] Error: Download failed. This is most likely a issue with your internet connection.')
		println('If you are absolutely sure you are connected, please file a bug report at https://github.com/Jocadbz/vaur')
		panic(err)
	}
	os.execute('gunzip ${os.home_dir()}/.cache/vaur/packages.gz')
}