#!/usr/bin/env bash

git pull origin master;

function init() {
  rsync --exclude ".git/" \
    --exclude "init.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~;
  sudo apt update;
  curl -fsS https://pkgx.sh | sh;

  pkgx install fish;
  pkgx install starship;
  pkgx install docker;

  pkgx install bun;
  pkgx install node;
  pkgx install python;
  pkgx install rustup;

  pkgx install exa;
  pkgx install bat;
  pkgx install rg;
  pkgx install fd;
  pkgx install btm;
  pkgx install tv;
  pkgx install zoxide;
  pkgx install gh;
  pkgx install neofetch;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  init;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    init;
  fi;
fi;

unset init;
source ~/.bashrc;
