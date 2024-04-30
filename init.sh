#!/usr/bin/env bash

sudo apt-add-repository ppa:fish-shell/release-3;
sudo apt update;
sudo apt upgrade;
sudo apt-get install fish exa neofetch;
git pull;

rsync --exclude ".git/" \
  --exclude "init.sh" \
  -avh --no-perms . ~;

curl https://get.docker.com | sh
curl https://starship.rs/install.sh | sh
curl https://mise.run | sh
echo '~/.local/bin/mise activate fish | source' >> ~/.config/fish/config.fish

# need helix

~/.local/bin/mise use bun
~/.local/bin/mise use node
~/.local/bin/mise use gleam
~/.local/bin/mise use python
~/.local/bin/mise use rust

~/.local/bin/mise use github-cli
~/.local/bin/mise use ripgrep
~/.local/bin/mise use fd
~/.local/bin/mise use bat
~/.local/bin/mise use bottom
