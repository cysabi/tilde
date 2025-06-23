fish_config theme choose "Catppuccin Mocha"
abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

set fish_greeting ""
set fish_prompt_pwd_dir_length 0
set hydro_symbol_start "\n"
set hydro_multiline true

set -gx EDITOR = "helix";
set -gx COLORTERM = "truecolor";
set -gx C = "/mnt/c/Users/cysabi";

alias eza 'eza --group-directories-first -TL1'

alias hx helix
alias cat bat
alias grep rg
alias ls eza
alias lt 'eza -T'

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina
