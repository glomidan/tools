# My tool kit #

*It’s my personal toolbox. I add my own scripts that I have developed since I gave up Windows for Arch-based systems! &#9829;*

## Bluetooth script ##

### Setup ###
This script works with `bluez` package. Please install it before lanch it. </br>

- Arch-based distro </br>
```
pacman -Sy bluez
pacman -Sy bluez-utils
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

## VIMrc ##

### Setup VIMrc ###
copy vimrc in home directory
```
cp vimrc ~/.vimrc
```
**Install Vandle**
- Install and build Vandle plugin
- Adapt VIMrc with your Vandle's install path
- Launch VIM
- Install VIM plugin:
```:plugin install```
- for update:
pull the Vandle repo and in VIM:
```:plugin update```

---
