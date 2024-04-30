#!/usr/bin/env bash

sudo apt-add-repository ppa:fish-shell/release-3;
sudo apt update;
sudo apt upgrade;
sudo apt-get install fish;
git pull;

rsync --exclude ".git/" \
  --exclude "init.sh" \
  -avh --no-perms . ~;

curl -fsS https://starship.rs/install.sh | sh
curl -fsS https://pkgx.sh | sh;

pkgx install docker;

pkgx install bun;
pkgx install node;
pkgx install python;
pkgx install rustup;

pkgx install hx;
pkgx install gh;
pkgx install zoxide;
pkgx install exa;
pkgx install rg;
pkgx install fd;
pkgx install bat;
pkgx install btm;
pkgx install tv;
pkgx install neofetch;
