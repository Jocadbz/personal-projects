module main

import os
import toml
import builtins
import betelgeuse_7.ansicolors as colors

fn main() {
	default_config := ['title', 'separator', 'os', 'kernel', 'shell', 'desktop', 'uptime', 'term']
	config_dir := os.config_dir() or { panic(err) }
	if os.exists('${config_dir}/lazyfetch/config.toml') == true {
		config := toml.parse_file('${config_dir}/lazyfetch/config.toml') or { panic(err) }
		modules := config.value('config.modules').array().as_strings()
		if modules[0..] == ['toml.Any(toml.Null{})'] {
			fetch(default_config)
		} else {
			fetch(modules)
		}
	} else {
		fetch(default_config)
	}
}

fn fetch(modules []string) {
	config_dir := os.config_dir() or { panic(err) }
	config := toml.parse_file('${config_dir}/lazyfetch/config.toml') or { panic(err) }
	path := config.value('config.path').string()
	for functions in modules {
		match functions {
			'title' {
				println(colors.bold(builtins.title()))
			}
			'separator' {
				println(colors.bold(builtins.separator()))
			}
			'kernel' {
				println(colors.bold('Kernel: ${builtins.kernel()}'))
			}
			'shell' {
				println(colors.bold('Shell: ${builtins.shell()}'))
			}
			'term' {
				println(colors.bold('Terminal: ${builtins.term()}'))
			}
			'os' {
				println(colors.bold('OS: ${builtins.os_parser()}'))
			}
			'desktop' {
				println(colors.bold('Desktop: ${builtins.desktop()}'))
			}
			'uptime' {
				println(colors.bold('Uptime: ${builtins.uptime()}'))
			}
			else {
				if os.exists('${path}/${functions}.toml') == false {
					// I guess it would be better to just do nothing on this situation...
				} else {
					module_to_load := toml.parse_file('${path}/${functions}.toml') or { panic(err) }
					command := os.execute(module_to_load.value('module.command').string())
					println(colors.bold('${module_to_load.value('module.pre').string()}${command.output}'))
				}
			}
		}
	}
}
