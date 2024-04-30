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

sudo pkgx install docker;

sudo pkgx install bun;
sudo pkgx install node;
sudo pkgx install python;
sudo pkgx install rustup;

sudo pkgx install hx;
sudo pkgx install gh;
sudo pkgx install exa;
sudo pkgx install rg;
sudo pkgx install fd;
sudo pkgx install bat;
sudo pkgx install btm;
sudo pkgx install tv;
sudo pkgx install neofetch;
