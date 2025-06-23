fish_config theme choose "Catppuccin Mocha"
abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

set -gx EDITOR "helix";
set -gx COLORTERM "truecolor";
set -gx C "/mnt/c/Users/cysabi";

set fish_greeting ""
set fish_prompt_pwd_dir_length 255
set hydro_symbol_start "\n"
set hydro_multiline true
set hydro_color_pwd b4befe
set hydro_color_git f9e2af
set hydro_color_error f38ba8
set hydro_color_prompt 94e2d5
set hydro_color_duration fab387

alias eza 'eza --group-directories-first -TL1'

alias hx helix
alias cat bat
alias grep rg
alias ls eza
alias lt 'eza -T'

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina
