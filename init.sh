#!/usr/bin/env bash

read -p "ready? " -n 1;
echo "";

sudo apt update;
git pull;

rsync --exclude ".git/" \
  --exclude "init.sh" \
  --exclude "README.md" \
  --exclude "LICENSE" \
  -avh --no-perms . ~;

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

source ~/.bashrc;
