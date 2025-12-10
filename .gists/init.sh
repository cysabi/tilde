# install arch
wsl.exe --install archlinux

# inside arch as root -- install packages
pacman -Syu base base-devel git fish vi helix
useradd -m -G wheel -s /bin/fish cysabi
visudo # uncomment %wheel ALL=(ALL:ALL) NOPASSWD: ALL

wsl.exe --manage archlinux --set-default-user cysabi

# inside arch as cysabi -- run tilde
curl https://raw.githubusercontent.com/cysabi/tilde/refs/heads/main/.config/fish/functions/tilde.fish | source
tilde
