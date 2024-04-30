#!/usr/bin/env bash

read -p "overwrite files? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  rsync --exclude ".git/" \
    --exclude "init.sh" \
    -avh --no-perms . ~;
fi

read -p "install packages? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  apt-add-repository ppa:fish-shell/release-3;
  add-apt-repository ppa:maveonair/helix-editor
  apt update;
  apt upgrade;
  apt-get install fish helix exa neofetch;
  git pull;

  curl https://starship.rs/install.sh | sh
  curl https://mise.run | sh
  curl https://get.docker.com | sh
fi
