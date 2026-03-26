fish_config theme choose "Catppuccin Mocha"
abbr --add dotdot --regex '^\.\.+$' --function dotdotdot

set fish_greeting ""
set fish_prompt_pwd_dir_length 255
set hydro_symbol_start "\n"
set hydro_multiline true
set hydro_color_pwd b4befe
set hydro_color_git f9e2af
set hydro_color_error f38ba8
set hydro_color_prompt 94e2d5
set hydro_color_duration fab387

alias hx helix
alias eza 'eza --group-directories-first -TL1'
alias ls eza
alias lt 'eza -T'
alias g gitu
alias cat bat
alias grep rg
alias neo macchina
alias pathvar 'echo "#  "; printf "%s\n" (string split \n $PATH)'

set -gx EDITOR "helix"
set -gx APP "/mnt/c/Users/cyrene/source/repos/phaze-app"
set -gx COLORTERM "truecolor";
set -gx C "/mnt/c/Users/cyrene";
set -gx ANDROID_HOME "/opt/android-sdk"
export PATH="$HOME/.local/bin:$PATH"
