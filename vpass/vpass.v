module main

import flag
import rand
import os

fn main() {
    mut fp := flag.new_flag_parser(os.args)
    fp.application('vpass')
    fp.version('v1.0.0')
    fp.limit_free_args(0, 0)!
    fp.description('This tool generates secure and random password combinations using hexadecimal numbers')
    fp.skip_executable()
    length := fp.int('length', 0, 15, "Password length. 15 letters is the default.")
    fp.finalize() or {
        eprintln(err)
        println(fp.usage())
        return
    }
	random(length)
}

fn random(number int) {
	combination := rand.hex(number)
	println(combination)
}
