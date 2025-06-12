set -g fish_greeting ""
fish_config theme choose "Catppuccin Mocha"

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
