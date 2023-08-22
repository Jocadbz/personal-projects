module builtins

import os

pub fn title() string {
	return '${os.loginname()}@${os.hostname()}'
}

pub fn separator() string {
	return '--------------'
}

pub fn desktop() string {
	wm := os.getenv('DESKTOP_SESSION')
	return wm
}

pub fn os_parser() string {
	os_file := os.read_lines('/etc/os-release') or { panic(err) }
	system := os_file[1].replace('PRETTY_NAME=', '')
	return system.replace('\"', '')
}

pub fn kernel() string {
	kernel := os.uname()
	return kernel.release
}

pub fn shell() string {
	shell := os.getenv('SHELL')
	return shell
}

pub fn uptime() string {
	uptime := os.execute('uptime -p')
	return uptime.output.replace('up ', '').replace('\n', '')
}

pub fn term() string {
	term := os.getenv('TERM')
	return term
}
