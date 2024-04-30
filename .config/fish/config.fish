function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function o
  if test (count $argv) -eq 0
    explorer.exe .
  else
    explorer.exe $argv
  end
end
function mv
  command mv --interactive --verbose $argv
end

function rm
  command rm --interactive --verbose $argv
end

function cp
  command cp --interactive --verbose $argv
end

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias md 'mkdir -p $argv; and cd $_'
alias dcp 'docker compose'
alias clr 'clear'
alias map 'xargs -n1'
alias dig 'dig +nocmd any +multiline +noall +answer'
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias localip 'powershell.exe ipconfig | r \"Address..*192.168.1.\"'
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

alias c 'bat'
alias r 'rg'
alias f 'fd'
alias t 'btm'
alias l 'exa --color auto'
alias ll 'exa --color auto -l'
alias la 'exa --color auto -la'
alias ld 'exa --color auto -lD'
alias lr 'exa --color auto -lR'
alias lt 'exa --color auto -lT'

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
~/.local/bin/mise activate fish | source
