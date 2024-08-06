function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function o
  if test (count $argv) -eq 0
    explorer.exe .
  else
    explorer.exe (echo $argv | string replace "/" "\\\\")
  end
end

function mv
  command mv -v -i $argv
end

function rm
  command rm -v -i $argv
end

function cp
  command cp -v -p -i $argv
end

function md
  command mkdir -v -p $argv; cd $argv
end

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias clr 'clear'
alias dcp 'docker compose'
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"

alias ll 'eza --color auto -l'
alias la 'eza --color auto -la'
alias ld 'eza --color auto -lD'
alias lr 'eza --color auto -lR'
alias lt 'eza --color auto -lT'

alias cat 'bat --paging=never'
alias grep 'ripgrep'
alias find 'fd'
alias ps 'procs'
alias du 'dust'
alias top 'btm'

set C "/mnt/c/Users/cysabi"
set -x EDITOR "hx"
set -g fish_greeting ""

alias g 'git'
set GIT_AUTHOR_NAME "cysabi"
set GIT_AUTHOR_EMAIL "47790183+cysabi@users.noreply.github.com"
set GIT_COMMITTER_NAME "$GIT_AUTHOR_NAME"
set GIT_COMMITTER_EMAIL "$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

starship init fish | source
atuin init fish | source
~/.local/bin/mise activate fish | source
