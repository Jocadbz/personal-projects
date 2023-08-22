import os

fn main() {
	arg1 := os.args[1]
	arg2 := os.args[2]
	os.mv(arg1, arg2) or {
		println("Failed to move files")
		return
	}
}