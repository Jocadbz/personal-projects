# vssh

A CLI-based SSH connection manager

## Usage
Commands:
- connect <connection> -- SSH to a saved connection
- remove <connection> -- Removes a saved connection
- list -- List the available connections
- add -- Add a new connection


## Why did you wrote this?

Managing multiple SSH  connections is an absolute **hell**.
Remembering IP's and users is not so pratical if you
you use SSH a lot (like me). So I wrote this.

It really does nothing much special, just store the
credentials for quick use later. While I *could*
use something like PuTTY, I do prefer doing things
on CLI, and hey, nothing better than write your own
software.


## Installation
```bash
# You need the V's compiler
$ git clone https://codeberg.org/jocadbz/vssh.git
$ cd vssh
$ v -prod src/main.v -o vssh
```
