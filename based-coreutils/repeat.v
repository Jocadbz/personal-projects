// Repeat: A echo replacement
import os

fn main() {
	if os.args[1] == "-n" {
       	print(os.args[2..].join(' '))
	} else {
		println(os.args[1..].join(' '))
	}
}