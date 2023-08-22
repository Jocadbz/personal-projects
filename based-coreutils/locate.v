// Locate: a whereis alternative
import os

fn main() {
	path := os.find_abs_path_of_executable(os.args[1]) or {
		println("We couldn't locate the files")
		return
	}
	println(path)
}