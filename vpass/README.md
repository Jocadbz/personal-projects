# VPASS
- I use this totally secure thing every day - Edward Snowden
- Why i can't hack this >:( - NSA
- This thing crashed my X11 session - My friend

A random password generator written in V

## Usage
```bash
vpass # Generates a 15-long password
vpass --length <number> # Generates a passord with the specified number
```


## Important things to notice
- This use Hex code, so it only generates with a-f and 0-9
- Don't use this for crypto. This uses PRNG, so it's not safe enough for High-level encryption. But it's ok for your google account lmfao.


## Installing
```bash
# You need the V compiler
git clone https://gitlab.com/jocadbz/vpass.git
cd vpass
v .
```

*Written in V, btw*
