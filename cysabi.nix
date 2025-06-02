{ config, pkgs, outPath, ... }:

{
  home.stateVersion = "25.05";
  home.username = "cysabi";
  home.homeDirectory = "/home/cysabi";
  home.shell.enableFishIntegration = true;
  home.packages = with pkgs; [
    gleam
    rustup
    bun
    go
    uv
  ];

  programs.fish = {
    enable = true;
    shellInit = "set -g fish_greeting ''";
    shellAliases = {
      l = "fish -c l";
      g = "lazygit";
      cat = "bat";
      grep = "rg";
      find = "fd";
      path = "echo \"#  \"; printf \"%s\\n\" (string split \\n $PATH)";
      neo = "macchina";
    };
    shellAbbrs = {
      dotdot = {
        regex = "^\\.\\.+$";
        function = "dotdotdot";
      };
    };
    functions = {
      dotdotdot = ''
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
      '';
      md = ''
        command mkdir -v $argv
        cd $argv
      '';
      nixos = ''
        if test $argv[1] = get
            nix profile install nixpkgs#$argv[2]
        else if test $argv[1] = reload
            sudo nixos-rebuild switch
        else if test $argv[1] = open
            if test not -d /etc/nixos/.git
                echo "cysabi/nixos doesn't exist! writing..."
                sudo rm -rfv /etc/nixos
                git clone https://github.com/cysabi/nixos ~/._nixos
                sudo mv ~/._nixos /etc/nixos
            end
            sudo hx --config ~/.config/helix/config.toml /etc/nixos
        end
      '';
      o = ''
        # get the directory to open
        set -f FP (realpath .)
        if test (count $argv) = 1
            set -f FP (realpath $argv)
        end

        # translate path to valid file explorer path
        if string match -rq "^/mnt/c/" $FP
            set -f FP (string replace -r "^/mnt/c/" "C:/" $FP)
        else
            set -f FP (string join "" "//wsl.localhost/Ubuntu" $FP)
        end

        set -f FP (string replace -a "/" "\\" $FP)
        explorer.exe $FP
      '';
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      directory = {
        truncation_length = 64;
        truncate_to_repo = false;
      };
    };
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "l";
    # TODO yaziPlugins
  };

  programs.eza = {
    enable = true;
    extraOptions = [
      "-1TL0"
      "--group-directories-first"
    ];
  };

  programs.bat = {
    enable = true;
    config = {
      paging = "never";
      theme = "base16";
      plain = true;
    };
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.fd = {
    enable = true;
  };

  programs.git = {
    delta.enable = true;
    extraConfig = {
      user.name = "cysabi";
      user.email = "47790183+cysabi@users.noreply.github.com";
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
          colorArg = "always";
          pager = "delta --paging=never";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        # basically theming
        true-color = true;
        undercurl = true;
        bufferline = "multiple";
        color-modes = true;

        statusline.mode.normal = "normal";
        statusline.mode.insert = "insert";
        statusline.mode.select = "select";
        statusline.separator = "/";
        statusline.left = [
          "mode"
          "spacer"
          "file-name"
          "position"
          "separator"
          "total-line-numbers"
          "spacer"
          "file-modification-indicator"
          "read-only-indicator"
        ];
        statusline.right = [
          "spinner"
          "spacer"
          "diagnostics"
          "spacer"
          "version-control"
          "spacer"
          "primary-selection-length"
          "separator"
          "selections"
          "register"
        ];
        cursorline = true;
        gutters.layout = [
          "diff"
          "spacer"
        ];
        preview-completion-insert = false;
        scrolloff = 10;
        scroll-lines = 1;
        soft-wrap.enable = true;

        # behaviors
        shell = [
          "fish"
          "-c"
        ];
        lsp.display-messages = true;
        file-picker.hidden = false;
        file-picker.ignore = false;
        file-picker.git-ignore = true;

        # diagnostics
        end-of-line-diagnostics = "info";
        inline-diagnostics.cursor-line = "info";
      };
      
      keys = let
        all = {
          # hjkl
          A-j = [ "ensure_selections_forward" "extend_to_line_bounds" "extend_char_right" "extend_char_left" "delete_selection" "add_newline_below" "move_line_down" "replace_with_yanked" ];
          A-k = [ "ensure_selections_forward" "flip_selections" "extend_to_line_bounds" "extend_char_right" "extend_char_left" "delete_selection" "move_line_up" "add_newline_above" "move_line_up" "replace_with_yanked" ];
          A-J = [ "extend_line_down" "extend_to_line_bounds" ];
          A-K = [ "extend_line_up" "extend_to_line_bounds" ];
          C-A-j = [ "ensure_selections_forward" "extend_to_line_bounds" "extend_char_right" "extend_char_left" "yank" "add_newline_below" "move_line_down" "replace_with_yanked" ];
          C-A-k = [ "ensure_selections_forward" "flip_selections" "extend_to_line_bounds" "extend_char_right" "extend_char_left" "yank" "add_newline_above" "move_line_up" "replace_with_yanked" ];
          A-h = [ "goto_line_start" ];
          A-l = [ "goto_line_end" ];
          # cmds
          C-r = [ ":config-reload" ":reload" ];
          C-q = [ ":quit" ];
          C-s = [ ":w" ];
          "C-/" = [ "toggle_comments" ];
          # clipboard
          C-c = [ ":clipboard-yank" ];
          C-x = [ ":clipboard-yank" "delete_selection_noyank" ];
          C-v = [ ":clipboard-paste-after" "collapse_selection" ];
          C-V = [ ":clipboard-paste-before" "collapse_selection" ];
          C-z = [ "undo" "collapse_selection" ];
          C-Z = [ "redo" ];
          # no alt
          A-up = "no_op";
          A-down = "no_op";
          A-left = "no_op";
          A-right = "no_op";
          A-S-down = "no_op";
        };
        norsel = {
          i = [ "collapse_selection" "insert_mode" ];
          a = [ "collapse_selection" "append_mode" ];
          H = "expand_selection";
          L = "shrink_selection";
          J = "select_next_sibling";
          K = "select_prev_sibling";
          X = "extend_line_above";
        };
      in {
        normal = all // norsel // { esc = [ "collapse_selection" "keep_primary_selection" ]; };
        select = all // norsel // { C-v = [ ":clipboard-paste-replace" "collapse_selection" ]; C-V = [ ":clipboard-paste-replace" "collapse_selection" ]; };
        insert = all;
      };
    };
    themes = {
      catppuccin_mocha = {
        inherits = "catppuccin_mocha";
        ui.background.fg = "text";  # disable background fill
      };
    };
  };
}
