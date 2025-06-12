fish_config theme choose "Catppuccin Mocha"

set -g fish_greeting ""
set -g hydro_multiline true
set -g fish_prompt_pwd_dir_length 0

abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

alias cat bat
alias find fd
alias grep rg
alias eza 'eza --group-directories-first'
alias ls eza
alias la 'eza -a'
alias ll 'eza -l'
alias lla 'eza -la'
alias lt 'eza --TL99'
alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina
alias g lazygit
