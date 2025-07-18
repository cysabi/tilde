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

alias cat bat
alias grep rg
alias ls eza
alias lt 'eza -T'

alias path 'echo "#  "; printf "%s\n" (string split \n $PATH)'
alias neo macchina

set -gx MISE_SHELL fish
set -gx __MISE_ORIG_PATH $PATH

function mise
  if test (count $argv) -eq 0
    command /root/.local/bin/mise
    return
  end

  set command $argv[1]
  set -e argv[1]

  if contains -- --help $argv
    command /root/.local/bin/mise "$command" $argv
    return $status
  end

  switch "$command"
  case deactivate shell sh
    # if help is requested, don't eval
    if contains -- -h $argv
      command /root/.local/bin/mise "$command" $argv
    else if contains -- --help $argv
      command /root/.local/bin/mise "$command" $argv
    else
      source (command /root/.local/bin/mise "$command" $argv |psub)
    end
  case '*'
    command /root/.local/bin/mise "$command" $argv
  end
end

function __mise_env_eval --on-event fish_prompt --description 'Update mise environment when changing directories';
    /root/.local/bin/mise hook-env -s fish | source;

    if test "$mise_fish_mode" != "disable_arrow";
        function __mise_cd_hook --on-variable PWD --description 'Update mise environment when changing directories';
            if test "$mise_fish_mode" = "eval_after_arrow";
                set -g __mise_env_again 0;
            else;
                /root/.local/bin/mise hook-env -s fish | source;
            end;
        end;
    end;
end;

function __mise_env_eval_2 --on-event fish_preexec --description 'Update mise environment when changing directories';
    if set -q __mise_env_again;
        set -e __mise_env_again;
        /root/.local/bin/mise hook-env -s fish | source;
        echo;
    end;

    functions --erase __mise_cd_hook;
end;

__mise_env_eval
if functions -q fish_command_not_found; and not functions -q __mise_fish_command_not_found
    functions -e __mise_fish_command_not_found
    functions -c fish_command_not_found __mise_fish_command_not_found
end

function fish_command_not_found
    if string match -qrv -- '^(?:mise$|mise-)' $argv[1] &&
        /root/.local/bin/mise hook-not-found -s fish -- $argv[1]
        /root/.local/bin/mise hook-env -s fish | source
    else if functions -q __mise_fish_command_not_found
        __mise_fish_command_not_found $argv
    else
        __fish_default_command_not_found_handler $argv
    end
end
