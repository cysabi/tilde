fish_config theme choose "Catppuccin Mocha"

set -g fish_greeting ""
set -g fish_prompt_pwd_dir_length 255
set -g hydro_symbol_start "\n"
set -g hydro_multiline true

abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

alias grep rg
alias find fd
alias cat 'bat --theme=base16'
alias eza 'eza --group-directories-first'
alias ls eza
alias la 'eza -a'
alias ll 'eza -l'
alias lla 'eza -la'
alias lt 'eza -T'
alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina
alias g lazygit
