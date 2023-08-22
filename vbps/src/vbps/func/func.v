module func

import os

pub fn check() {
	if os.exists("${os.home_dir()}/.config/vbps") == false {
		os.mkdir("${os.home_dir()}/.config/vbps") or { panic(err) }
		os.create("${os.home_dir()}/.config/vbps/config.toml") or { panic(err) }

		text := "# Warning: Changing config files might break vbps
[repos]
nonfree = false
multilib = false
multilib_nonfree = false
debug = false

[wrapper]
auth = '/usr/bin/sudo'
xbps_install_loc = '/usr/bin/xbps-install'
xbps_remove_loc = '/usr/bin/xbps-remove'
xbps_query_loc = '/usr/bin/xbps-query'"

		os.write_file("${os.home_dir()}/.config/vbps/config.toml", text) or { panic(err) }
	}
}
