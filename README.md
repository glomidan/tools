# My tool kit #

*It’s my personal toolbox. I add my own scripts that I have developed since I gave up Windows for Arch-based systems! &#9829;*

## Bluetooth script ##

### Setup ###
This script works with `bluez` package. Please install it before lanch it. </br>

- Arch-based distro </br>
```
~ ❯ pacman -Sy bluez
~ ❯ pacman -Sy bluez-utils
```

- Debian-based distro </br>
```
apt update
apt install -y bluez
apt install -y bluetooth
```

- Copy the `blueth` binary in local bin folder </br>
```
cp blueth /usr/local/bin
```

### How to use ###
Just run the binary and follow the given instructions... :) </br>
```
~ ❯ blueth
Choose option : connect[c]/disconnect[d]
connect
...
```

---

## ZSHrc ##

### Setup OhMyZsh / Powerlevel10k theme ###
- Install zsh

- Arch-based distro </br>
```
~ ❯ pacman -Sy zsh
```

- Debian-based distro </br>
```
apt update
apt install -y zsh
```

---
