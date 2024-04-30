function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function md --wraps mkdir
  command mkdir -p $argv
  if test $status = 0
    switch $argv[(count $argv)]
      case '-*'
      case '*'
        cd $argv[(count $argv)]
        return
    end
  end
end

set -x EDITOR "hx"
alias o 'if test (count $argv) -eq 0; explorer.exe .; else; explorer.exe $argv; end'
alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias mv 'command mv --interactive --verbose'
alias rm 'command rm --interactive --verbose'
alias cp 'command cp --interactive --verbose'
alias dcp 'docker compose'
alias clr 'clear'
alias map 'xargs -n1'
alias dig 'dig +nocmd any +multiline +noall +answer'
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias localip 'powershell.exe ipconfig | r \"Address..*192.168.1.\"'
alias ifactive "ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

alias g 'git'
alias diff 'git diff --no-index --color-words "$@"'

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

GIT_AUTHOR_NAME="cysabi"
GIT_AUTHOR_EMAIL="47790183+cysabi@users.noreply.github.com"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

fish_add_path ~/.bin
fish_add_path ~/.cargo/bin
fish_add_path -m /bin
fish_add_path -m /usr/bin
fish_add_path -m ~/.local/bin

starship init fish | source
zoxide init fish | source

# === LOCAL CHANGES ===
