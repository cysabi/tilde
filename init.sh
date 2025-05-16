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
  git pull;
  apt-add-repository ppa:fish-shell/release-3;
  apt update;
  apt upgrade;
  apt install fish build-essential;

  curl --proto '=https' -sS https://starship.rs/install.sh | sh
  curl --proto '=https' -sS https://get.docker.com | sh
  curl --proto '=https' -sS https://mise.run | sh
  curl --proto '=https' -sS https://setup.atuin.sh | sh

fi

fish
mise install
