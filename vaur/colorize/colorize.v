module colorize

pub fn reset() {
	print('\033[0m')
}

pub fn bold() {
	print('\033[1m')
}

pub fn dim() {
	print('\033[2m')
}

pub fn underline() {
	print('\033[4m')
}

pub fn blink() {
		print('\033[5m')
}

pub fn invert() {
	print('\033[7m')
}

pub fn hide() {
	print('\033[8m')
}

pub fn no_bold() {
	print('\033[21m')
}

pub fn no_dim() {
	print('\033[22m')
}

pub fn no_underline() {
	print('\033[24m')
}

pub fn no_blink() {
	print('\033[25m')
}

pub fn regular() {
	print('\033[27m')
}

pub fn show() {
	print('\033[28m')
}

pub fn default() {
	print('\033[39m')
}

pub fn black() {
	print('\033[30m')
}

pub fn red() {
	print('\033[31m')

}

pub fn green() {
	print('\033[32m')
}

pub fn yellow() {
	print('\033[33m')
}

pub fn blue() {
	print('\033[34m')
}

pub fn magenta() {
	print('\033[35m')
}

pub fn cyan() {
	print('\033[36m')
}

pub fn light_gray() {
	print('\033[37m')
}

pub fn dark_gray() {
	print('\033[90m')
}

pub fn light_red() {
	print('\033[91m')
}

pub fn light_green() {
	print('\033[92m')
}

pub fn light_yellow() {
		print('\033[93m')
}

pub fn light_blue() {
	print('\033[94m')
}

pub fn light_magenta() {
	print('\033[95m')
}

pub fn light_cyan() {
	print('\033[96m')
}

pub fn white() {
	print('\033[97m')
}

pub fn bg_black() {
	print('\033[40m')
}

pub fn bg_red() {
	print('\033[41m')
}

pub fn bg_green() {
	print('\033[42m')
}

pub fn bg_yellow() {
	print('\033[43m')
}

pub fn bg_blue() {
	print('\033[44m')
}

pub fn bg_magenta() {
	print('\033[45m')
}

pub fn bg_cyan() {
	print('\033[46m')
}

pub fn bg_light_gray() {
	print('\033[47m')
}

pub fn bg_dark_gray() {
	print('\033[100m')
}

pub fn bg_light_red() {
	print('\033[101m')
}

pub fn bg_light_green() {
	print('\033[102m')
}

pub fn bg_light_yellow() {
	print('\033[103m')
}

pub fn bg_light_blue() {
	print('\033[104m')
}

pub fn bg_light_magenta() {
	print('\033[105m')
}

pub fn bg_light_cyan() {
	print('\033[106m')
}

pub fn bg_white() {
	print('\033[107m')
}
