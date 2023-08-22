module main

import os

fn main() {
	if '--help' in os.args[1..] {
		println('The BBIL Interpreter
Usage:
bbil <file>

Flags:
--help - Display this message
--version - Displays the Interpreter version')
		exit(0)
	}
	if '--version' in os.args[1..] {
		println('BBIL Version 0.1.0-ALPHA')
		exit(0)
	}
	if os.args[1..] == [] {
		println("Error: BBIL expected a file.")
		exit(1)
	}
	parser(os.args[1])
}

fn parser(source string) {
	lines := os.read_lines(source) or { panic(err) }
	for c, i in lines {
		func := i.split(' ')
		if func[0] == 'print' {
			if func[1..] == [] {
				println('ERROR IN LINE ${c + 1}:
PRINT expected at least one argument')
				exit(1)
			}
			print(func[1..].join(' '))
			print('\n')
		} else if func[0] == 'execute' {
			if func[1..] == [] {
				println('ERROR IN LINE ${c + 1}:
EXECUTE expected at least one argument')
				exit(1)
			}
			os.system(func[1..].join(' '))
		} else if func[0] == 'delete' {
			if func[1..] == [] {
				println('ERROR IN LINE ${c + 1}:
DELETE expected at least one argument')
				exit(1)
			}
			os.rm(func[1..].join(' ')) or { panic(err) }
		} else if func[0] == 'create' {
			if func[1..] == [] {
				println('ERROR IN LINE ${c + 1}:
CREATE expected at least one argument')
				exit(1)
			}
			os.create(func[1..].join(' ')) or { panic(err) }
		} else if func[0] == 'move' {
			if func[1..].len < 2 {
				println('ERROR IN LINE ${c + 1}:
MOVE expected at least two arguments')
				exit(1)
			}
			os.mv(func[1], func[2]) or { panic(err) }
		}
		else if func[0] == "#" {
			// Do nothing
		}
		else {
			println('ERROR IN LINE ${c + 1}:
Undefined indent')
				exit(1)
		}
	}
}