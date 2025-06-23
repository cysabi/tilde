fish_config theme choose "Catppuccin Mocha"
abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

set -gx EDITOR = "helix";
set -gx COLORTERM = "truecolor";
set -gx C = "/mnt/c/Users/cysabi";

set fish_greeting ""
set fish_prompt_pwd_dir_length 0
set hydro_color_pwd $fish_color_cwd
set hydro_color_git $fish_pager_color_prefix
set hydro_color_start $fish_color_host
set hydro_color_error $fish_color_error
set hydro_color_prompt $fish_color_user
set hydro_color_duration $fish_color_end
set hydro_symbol_start "\n"
set hydro_multiline true

alias eza 'eza --group-directories-first -TL1'

alias hx helix
alias cat bat
alias grep rg
alias ls eza
alias lt 'eza -T'

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina
