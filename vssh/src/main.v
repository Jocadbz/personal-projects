module main

import os
import toml

fn main() {
	check()
	if os.args[1..].len == 0 {
		println("No arguments provided.")
		exit(1)
	}
	if '--help' in os.args[1..] {
		println("VSSH
Commands:
- connect <connection> -- SSH to a saved connection
- remove <connection> -- Removes a saved connection
- list -- List the available connections
- add -- Add a new connection")
		exit(0)
	}
	if 'add' in os.args[1..] {
		ssh_add()
		exit(0)
	}
	if 'connect' in os.args[1..] {
		for i, connect in os.args[1..] {
			if connect == 'connect' {
				num := i+2
				ssh_connect(os.args[num])
			}
		}
	}
    if 'remove' in os.args[1..] {
        for i, remove in os.args[1..] {
            if remove == 'remove' {
                num := i+2
                ssh_remove(os.args[num])
            }
        }
		exit(0)
    }
    if 'edit' in os.args[1..] {
        for i, remove in os.args[1..] {
            if remove == 'edit' {
                num := i+2
                ssh_edit(os.args[num])
            }
        }
        exit(0)
    }
	if 'list' in os.args[1..] {
		ssh_list()
		exit(0)
	}
	else {
		println("Argument not recognized")
		exit(1)
	}
}

fn ssh_add() {
	config := os.config_dir() or { panic(err) }
	println("These steps will guide you to set a new SSH connection")
	ssh_user := os.input("First, enter the username you will be using for your connection: ")
	ssh_ip := os.input("Now, enter the IP or domain you will acess: ")
	ssh_port := os.input("Select the port SSH will operate (If you aren't sure, enter 22.): ")
	println("\nPlease, revise your connection settings.")
	println(" - ${ssh_user}@${ssh_ip}\nPort = ${ssh_port}")
	// I shall just use a for loop here.
	for {
		selection := os.input("Is that right? (yes/no): ")
		if selection == 'no' {
			println("Cancelled by user.")
			exit(1)
		}
		else if selection == 'yes' {
			ssh_text := os.input("Enter the connection name: ")
			text := "name = \"${ssh_text}\"
user = \"${ssh_user}\"
ip = \"${ssh_ip}\"
port = \"${ssh_port}\""
			os.create("${config}/sshmanagercli/connections/${ssh_text}.toml") or { panic(err) }
			os.write_file("${config}/sshmanagercli/connections/${ssh_text}.toml", text) or { panic(err) }
			exit(0)
		}
	}
}

fn ssh_remove(connection string) {
	config := os.config_dir() or { panic(err) }
	if os.exists("${config}/sshmanagercli/connections/${connection}.toml") == false {
		println("This connection does not exists.")
		exit(1)
	}
	os.rm("${config}/sshmanagercli/connections/${connection}.toml") or { panic(err) }
}

fn check() {
	config := os.config_dir() or { panic(err) }
	if os.exists("${config}/sshmanagercli") == false {
		os.mkdir("${config}/sshmanagercli") or { panic(err) }
	}
    if os.exists("${config}/sshmanagercli/connections") == false {
        os.mkdir("${config}/sshmanagercli/connections") or { panic(err) }
    }
}


fn ssh_list() {
	config := os.config_dir() or { panic(err) }
	connections := os.ls("${config}/sshmanagercli/connections/") or { panic(err) }
	for connect in connections {
		doc := toml.parse_file("${config}/sshmanagercli/connections/${connect}") or { panic(err) }
		println("- ${doc.value('name').string()}
${doc.value('user').string()}@${doc.value('ip').string()} Port=${doc.value('port').string()}
")
	}
}

fn ssh_connect(connection string) {
	config := os.config_dir() or { panic(err) }
	if os.exists("${config}/sshmanagercli/connections/${connection}.toml") == false {
		println("Error: This connection dones not exists.")
		exit(1)
	}
	ssh_bin := os.find_abs_path_of_executable("ssh") or { panic(err) }
	println("Found ssh (${ssh_bin})")
	doc := toml.parse_file("${config}/sshmanagercli/connections/${connection}.toml") or { panic(err) }
	ssh_user := doc.value("user").string()
	ssh_ip := doc.value("ip").string()
	ssh_port := doc.value("port").string()
	os.execvp(ssh_bin, ['-p', ssh_port, '${ssh_user}@${ssh_ip}']) or { panic(err) }
}


fn ssh_edit(connection string) {
    config := os.config_dir() or { panic(err) }
    if os.exists("${config}/sshmanagercli/connections/${connection}.toml") == false {
        println("This connection does not exists.")
        exit(1)
    }
	editor := os.getenv('EDITOR')
	if editor == '' {
		println("No EDITOR variable found, defaulting to nano.")
		os.system("nano ${config}/sshmanagercli/connections/${connection}.toml")
	}
	else {
		os.system('${editor} ${config}/sshmanagercli/connections/${connection}.toml')
	}
}




