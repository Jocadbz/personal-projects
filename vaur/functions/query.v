module functions

import strings
import os

pub fn query(query []string) {
	mut result := []string{}
	for package in query {
		packages := os.read_lines('${os.home_dir()}/.cache/vaur/packages') or { panic(err) }

		for pkg in packages {
			queries := strings.levenshtein_distance_percentage(pkg, package)
			if queries > 60 {
				result << pkg
				// 
			}
		}
	}
	println("\033[1mYour search returned ${result.len} results:")
	println("")
	for pkg in result {
		println("\033[34;1maur\033[0m\033[1m/${pkg}\033[0m")
	}
}