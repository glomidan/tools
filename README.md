# My tool kit #

## Bluetooth script ##

### Setup ###

Arch-based distro
---This script works with `bluez`  package. Please install it before lanch it. </br>
`~ ❯ pacman -Sy bluez`
`~ ❯ pacman -Sy bluez-utils`

Debian-based distro
`apt update`
`apt install -y bluez`
`apt install -y bluetooth`

Copy the "blueth" binary in local bin folder </br>
`cp blueth /usr/local/bin`

### How to use ###
Just run the binary and follow the given instructions... :) </br>
`~ ❯ blueth
Choose option : connect[c]/disconnect[d]
connect
...`
