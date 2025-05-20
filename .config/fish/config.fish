function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end

function o
    # figure out which program to use
    if command -q files-stable.exe
        set -f PRGM files-stable.exe
    else
        set -f PRGM explorer.exe
    end

    # get the directory to open
    set -f FP (realpath .)
    if test (count $argv) = 1
        set -f FP (realpath $argv)
    end

    # translate realpath to valid file explorer path
    if string match -rq "^/mnt/c/" $FP
        set -f FP (string replace -r "^/mnt/c/" "C:/" $FP)
    else
        set -f FP (string join '' "\\\\wsl.localhost\Ubuntu" $FP)
    end

    $PRGM $FP
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
    command mkdir -v -p $argv
    cd $argv
end

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
~/.local/bin/mise activate fish | source
