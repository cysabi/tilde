function dotdotdot
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

function o
    # get the directory to open
    set -f FP (realpath .)
    if test (count $argv) = 1
        set -f FP (realpath $argv)
    end

    # translate path to valid file explorer path
    if string match -rq "^/mnt/c/" $FP
        set -f FP (string replace -r "^/mnt/c/" "C:/" $FP)
    else
        set -f FP (string join '' "//wsl.localhost/Ubuntu" $FP)
    end

    set -f FP (string replace -a "/" "\\" $FP)
    explorer.exe $FP
end

function l
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

function mv
    command mv -vI $argv
end

function rm
    command rm -vI $argv
end

function cp
    command cp -vip $argv
end

function md
    command mkdir -vp $argv
    cd $argv
end

alias gits 'lazygit'
alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias clr clear
alias dcp 'docker compose'
alias dock 'sudo systemctl start docker.service'
alias whatsmyip "dig +short myip.opendns.com @resolver1.opendns.com"

alias ls 'eza -1TL1 --group-directories-first'
alias cat 'bat --paging=never --plain --theme base16'
alias grep rg

set GIT_AUTHOR_NAME cysabi
set GIT_AUTHOR_EMAIL "47790183+cysabi@users.noreply.github.com"
set GIT_COMMITTER_NAME "$GIT_AUTHOR_NAME"
set GIT_COMMITTER_EMAIL "$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

set C /mnt/c/Users/cysabi
set -gx EDITOR hx
set -gx COLORTERM truecolor
set -g fish_greeting ""

starship init fish | source
atuin init fish | source
~/.local/bin/mise activate fish --shims | source
