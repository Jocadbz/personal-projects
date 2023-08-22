# VAUR
A AUR helper written in V, written to be simple as possible


### Features
- No libalpm (Because no bindings yet)
- Multithreading


### Should I use this?
Well, yes, if you can tolerate it's quirks. 
VAUR was written because I've wanted a simple  
and hassle-free AUR helper.<br>

If you can't get past that, and want minimal 
interaction on your installation, I reccomend 
Yay, Paru and Pikaur. <br>


### Well, if you don't use libalpm, how do you fetch updates?
Simple. Every time we run the update command, 
VAUR fetchs all PKGBUILDS for all AUR programs. 
If any change is detected, VAUR installs it again.<br>

Yeah, sounds horrible. But it's what you normally 
would do if you mantained your AUR packages manually.<br>


### TODO

- [x] Implement functions
- [ ] Check for AUR dependencies
- [x] Implement updates for AUR packages
- [x] Implement database for installed packages