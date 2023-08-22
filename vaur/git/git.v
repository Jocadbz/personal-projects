module git

import os

pub fn clone(path string, url string) {
	os.execute("git -C ${path} clone ${url}")
}

pub fn pull(path string) {
	os.system("git -C ${path} pull")
}