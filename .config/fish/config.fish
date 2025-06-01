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

function mv
    command mv -v $argv
end

function rm
    command rm -vI $argv
end

function cp
    command cp -v $argv
end

function md
    command mkdir -v $argv
    cd $argv
end

alias ls 'eza -1TL1 --group-directories-first'
alias cat 'bat --paging=never --plain --theme base16'
alias grep rg
alias find fd
alias g lazygit

alias dcp 'docker compose'
alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias whatsmyip "dig +short myip.opendns.com @resolver1.opendns.com"

set C /mnt/c/Users/cysabi
set -g fish_greeting ""
