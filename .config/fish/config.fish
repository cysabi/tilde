fish_config theme choose "Catppuccin Mocha"

set -g fish_greeting ""
set -g fish_prompt_pwd_dir_length 255
set -g hydro_symbol_start "\n"
set -g hydro_multiline true

set -gx EDITOR = "helix";
set -gx COLORTERM = "truecolor";
set -gx C = "/mnt/c/Users/cysabi";

set GIT_AUTHOR_NAME cysabi
set GIT_AUTHOR_EMAIL "47790183+cysabi@users.noreply.github.com"
set GIT_COMMITTER_NAME "$GIT_AUTHOR_NAME"
set GIT_COMMITTER_EMAIL "$GIT_AUTHOR_EMAIL"

abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

alias bat 'bat --theme=base16 --paging=never -p'
alias eza 'eza --group-directories-first -TL1'

alias hx helix
alias cat bat
alias grep rg
alias ls eza
alias lt 'eza -T'
alias l yy

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina
