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
  apt-get install fish;

  curl https://starship.rs/install.sh | sh
  curl https://get.docker.com | sh
  curl https://mise.run | sh

  mise install
fi
