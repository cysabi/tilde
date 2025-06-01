{ config, pkgs, ... }:

{
  home.username = "cysabi";
  home.homeDirectory = "/home/cysabi";
  home.shell.enableFishIntegration = true;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  programs.fish = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    extraOptions = [ "-1TL1" "--group-directories-first" ];
  };

  programs.bat = {
    enable = true;
    syntaxes = {
      gleam = {
        src = pkgs.fetchFromGitHub {
          owner = "molnarmark";
          repo = "sublime-gleam";
        };
        file = "syntax/gleam.sublime-syntax";
      };
    }

    --paging=never --plain --theme base16
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        # basically theming;
        true-color = true;
        undercurl = true;
        bufferline = "multiple";
        color-modes = true;

        statusline.mode.normal = "normal";
        statusline.mode.insert = "insert";
        statusline.mode.select = "select";
        statusline.separator = "/";
        statusline.left = ["mode", "spacer", "file-name", "position", "separator", "total-line-numbers", "spacer", "file-modification-indicator", "read-only-indicator"];
        statusline.right = ["spinner", "spacer", "diagnostics", "spacer", "version-control", "spacer", "primary-selection-length", "separator", "selections", "register"];
        cursorline = true;
        gutters.layout = ["diff", "spacer"];
        preview-completion-insert = false;
        scrolloff = 10;
        scroll-lines = 1;
        soft-wrap.enable = true;

        # behaviors;
        shell = ["fish", "-c"];
        lsp.display-messages = true;
        file-picker.hidden = false;
        file-picker.ignore = false;
        file-picker.git-ignore = true;

        # diagnostics;
        end-of-line-diagnostics = "info";
        inline-diagnostics.cursor-line = "info";
      };
      keys = {
        # h j k l;
        normal.A-j = ["ensure_selections_forward", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "delete_selection", "add_newline_below", "move_line_down", "replace_with_yanked"];
        select.A-j = ["ensure_selections_forward", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "delete_selection", "add_newline_below", "move_line_down", "replace_with_yanked"];
        insert.A-j = ["ensure_selections_forward", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "delete_selection", "add_newline_below", "move_line_down", "replace_with_yanked"];

        normal.A-k = ["ensure_selections_forward", "flip_selections", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "delete_selection", "move_line_up", "add_newline_above", "move_line_up", "replace_with_yanked"];
        select.A-k = ["ensure_selections_forward", "flip_selections", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "delete_selection", "move_line_up", "add_newline_above", "move_line_up", "replace_with_yanked"];
        insert.A-k = ["ensure_selections_forward", "flip_selections", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "delete_selection", "move_line_up", "add_newline_above", "move_line_up", "replace_with_yanked"];

        normal.A-J = ["extend_line_down", "extend_to_line_bounds"];
        select.A-J = ["extend_line_down", "extend_to_line_bounds"];
        insert.A-J = ["extend_line_down", "extend_to_line_bounds"];

        normal.A-K = ["extend_line_up", "extend_to_line_bounds"];
        insert.A-K = ["extend_line_up", "extend_to_line_bounds"];
        select.A-K = ["extend_line_up", "extend_to_line_bounds"];

        normal.C-A-j = ["ensure_selections_forward", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "yank", "add_newline_below", "move_line_down", "replace_with_yanked"];
        select.C-A-j = ["ensure_selections_forward", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "yank", "add_newline_below", "move_line_down", "replace_with_yanked"];
        insert.C-A-j = ["ensure_selections_forward", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "yank", "add_newline_below", "move_line_down", "replace_with_yanked"];

        normal.C-A-k = ["ensure_selections_forward", "flip_selections", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "yank", "add_newline_above", "move_line_up", "replace_with_yanked"];
        select.C-A-k = ["ensure_selections_forward", "flip_selections", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "yank", "add_newline_above", "move_line_up", "replace_with_yanked"];
        insert.C-A-k = ["ensure_selections_forward", "flip_selections", "extend_to_line_bounds", "extend_char_right", "extend_char_left", "yank", "add_newline_above", "move_line_up", "replace_with_yanked"];

        normal.A-h = "goto_line_start";
        select.A-h = "goto_line_start";
        insert.A-h = "goto_line_start";

        normal.A-l = "goto_line_end";
        select.A-l = "goto_line_end";
        insert.A-l = "goto_line_end";

        normal.H = "expand_selection";
        select.H = "expand_selection";

        normal.L = "shrink_selection";
        select.L = "shrink_selection";

        normal.J = "select_next_sibling";
        select.J = "select_next_sibling";

        normal.K = "select_prev_sibling";
        select.K = "select_prev_sibling";

        # nicer selections;
        normal.esc = ["collapse_selection", "keep_primary_selection"];
        normal.i = ["collapse_selection", "insert_mode"];
        normal.a = ["collapse_selection", "append_mode"];

        select.i = ["collapse_selection", "insert_mode"];
        select.a = ["collapse_selection", "append_mode"];

        normal.X = "extend_line_above";
        select.X = "extend_line_above";

        # commands;
        normal.C-r = [":config-reload", ":reload"];
        select.C-r = [":config-reload", ":reload"];
        insert.C-r = [":config-reload", ":reload"];

        normal.C-q = [":quit"];
        select.C-q = [":quit"];
        insert.C-q = [":quit"];

        # clipboard;
        normal.C-s = [":w"];
        select.C-s = [":w"];
        insert.C-s = [":w"];

        normal.C-c = [":clipboard-yank"];
        select.C-c = [":clipboard-yank"];
        insert.C-c = [":clipboard-yank"];

        normal.C-x = [":clipboard-yank", "delete_selection_noyank"];
        select.C-x = [":clipboard-yank", "delete_selection_noyank"];
        insert.C-x = [":clipboard-yank", "delete_selection_noyank"];

        normal.C-v = [":clipboard-paste-after", "collapse_selection"];
        select.C-v = [":clipboard-paste-replace", "collapse_selection"];
        insert.C-v = [":clipboard-paste-after", "collapse_selection"];

        normal.C-V = [":clipboard-paste-before", "collapse_selection"];
        select.C-V = [":clipboard-paste-replace", "collapse_selection"];
        insert.C-V = [":clipboard-paste-before", "collapse_selection"];

        normal.C-z = ["undo", "collapse_selection"];
        select.C-z = ["undo", "collapse_selection"];
        insert.C-z = ["undo", "collapse_selection"];

        normal.C-Z = ["redo"];
        select.C-Z = ["redo"];
        insert.C-Z = ["redo"];

        # disable arrows;
        normal.A-up = "no_op";
        normal.A-down = "no_op";
        normal.A-left = "no_op";
        normal.A-right = "no_op";
        normal.A-S-down = "no_op";
      };
    };
    themes = {
      catppuccin_mocha = {
        inherits = "catppuccin_mocha";
        "ui.background" = { fg = "text" }; # disable background fill
      };
    };
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "l";
    # TODO yaziPlugins
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # rust utils
    bat
    ripgrep
    fd

    # git
    gh
    lazygit # TODO add git: paging: colorArg: always \n pager: delta --dark --file-style none --hyperlinks --paging=never

    # code
    gleam
    rust
    bun
    go
    uv
  ];

  programs.git = {
    delta = {
      enable = true;
    };
    userName = "cysabi";
    userEmail = "47790183+cysabi@users.noreply.github.com";
    aliases = {
      l = "log --pretty=oneline -n 20 --graph --abbrev-commit"; # View abbreviated SHA, description, and history graph of the latest 20 commits
      s = "status -s"; # View the current working tree status using the short format
      d = "!\"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat\""; # Show the diff between the latest commit and the current state
      di = "!\"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d\""; # `git di $number` shows the diff between the state `$number` revisions ago and the current state
      p = "!\"git pull; git submodule foreach git pull origin main\""; # Pull in remote changes for the current repository and all its submodules
      pr = "!\"pr() { git fetch origin pull/$1/head:pr-$1; git checkout pr-$1; }; pr\""; # Checkout a pull request from origin (of a github repository)
      c = "clone --recursive"; # Clone a repository including all submodules
      ca = "!git add -A && git commit -av"; # Commit all changes
      go = "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f"; # Switch to a branch, creating it if necessary
      graph = "log --graph --color --pretty=format:\"%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%x20(%ce)%n%x20%s%n\""; # Color graph log view
      tags = "tag -l"; # Show verbose output about tags, branches or remotes
      branches = "branch -a";
      remotes = "remote -v";
      amend = "commit --amend --reuse-message=HEAD"; # Amend the currently staged files to the latest commit
      credit = "!f() { git commit --amend --author \"$1 <$2>\" -C HEAD; }; f"; # Credit an author on the latest commit
      reb = "!r() { git rebase -i HEAD~$1; }; r"; # Interactive rebase with the given number of latest commits
      fb = "!f() { git branch -a --contains $1; }; f"; # Find branches containing commit
      ft = "!f() { git describe --always --contains $1; }; f"; # Find tags containing commit
      fc = "!f() { git log --pretty=format:'%C(yellow)%h	%Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S$1; }; f"; # Find commits by source code
      fm = "!f() { git log --pretty=format:'%C(yellow)%h	%Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --rg=$1; }; f"; # Find commits by commit message
      dm = "!git branch --merged | rg -v '\\*' | xargs -n 1 git branch -d; git remote -v update -p"; # Remove branches that have already been merged with main
      contributors = "shortlog --summary --numbered"; # List contributors with number of commits
      lg = "log --color --decorate --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an (%G?)>%Creset' --abbrev-commit";
      mdiff = "!f() { git stash | head -1 | rg -q 'No local changes to save'; x=$?; git merge --no-commit $1 &>/dev/null; git add -u &>/dev/null; git diff --staged; git reset --hard &>/dev/null; test $x -ne 0 && git stash pop &>/dev/null; }; f";
      unreleased = "!f() { git fetch --tags && git diff $(git tag | tail -n 1); }; f";
      undo = "!git reset HEAD~1 --mixed";
      top = "!git log --format=format:%an | sort | uniq -c | sort -r | head -n 20";
    },
  };

  home.stateVersion = "25.05";
}
