<h1 align="center"><code>VBPS</code></h1>
<p align="center">A feature-rich wrapper for XBPS written in V</p>


## Features
- Provides simple syntax for XBPS
- Provides a simple way to manage Void Linux repositories
- Manages Runit services
- Manages packages from void-packages


## Installing
- From source

You will need V's compiler.
```bash
git clone https://github.com/jocadbz/vbps
cd vbps
./build.sh
```

You will have then, four files: `vbps`, `vbps-repos`, `vbps-runit` and `vbps-src`.
Add them to your path.


## Summary
All of the above functionality is distributed on the four binaries.
All of them will be merged on one in the future.

### VBPS
The main wrapper.

Basic Usage:
install, i - Installs a package
update, u - Updates the system, and optionally installs a package within the same operation
remove, r - Remove a package
repo-search, rs - Searchs for a package on the remote repository
local-search, ls - Searchs for a package within the packages installed on your system


You can change on VBPS's config file the PATHs of all XBPS commands and change your privileges agent (from sudo to doas, for example).


### VBPS-REPOS
The binary that manages Void Linux repos.
Void has 5 different repos:

- default
- nonfree
- multilib
- multilib-nonfree
- debug

The last four comes disabled by default.
On the first run, VBPS-REPOS will generate a config file located at `~/.config/vbps/config.toml`.
On the repos you want to enable, change from `false` to `true`, and run VBPS-REPOS again.
It will automatically install them for you.


### VBPS-RUNIT
The binary that manages Runit services.

Basic Usage:
enable, up - Enable a service
disable, down - Disable a service
status - Show the current services PIDs and statuses.

Warning: There is no need to write the full path of the service, VBPS-RUNIT does that for you.


### VBPS-SRC
The binary that manages manually compiled packages.

Basic Usage:
build, b - Builds a package
install, i - Installs a package
install-nonfree, in - Installs a package with a nonfree license
update, u - Updates the repository

At the first run, VBPS-SRC will detect if you have a cloned void-packages repo, and if you don't,
It will clone for you.


## LICENSE
VBPS comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
See LICENSE for more information.


*Written in V, btw*
