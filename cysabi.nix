{ config, pkgs, outPath, ... }:

{
  home.stateVersion = "25.05";
  home.username = "cysabi";
  home.homeDirectory = "/home/cysabi";
  home.packages = with pkgs; [
    gleam
    rustup
    bun
    nodejs_22
    uv
  ];

  programs.go = {
    enable = true;
    goPath = ".local/share/go";
  };

  programs.atuin = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = false;
    extraOptions = [
      "--group-directories-first"
    ];
  };

  programs.bat = {
    enable = true;
    config = {
      paging = "never";
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
          C-r = [ ":config-reload" ":reload" ":lsp-restart" ];
          C-q = [ ":quit" ];
          C-s = [ ":w" ":format" ];
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
          "#" = [ "toggle_comments" ];
        };
      in {
        normal = all // norsel // { esc = [ "collapse_selection" "keep_primary_selection" ]; };
        select = all // norsel // { C-v = [ ":clipboard-paste-replace" "collapse_selection" ]; C-V = [ ":clipboard-paste-replace" "collapse_selection" ]; };
        insert = all;
      };
    };
  };
}
