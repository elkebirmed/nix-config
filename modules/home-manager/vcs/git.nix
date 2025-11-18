# ============================================================================
# Git - Version control system.
# - https://git-scm.com/
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = lib.mkDefault true;

    # Use the full Git package with all features.
    package = lib.mkDefault pkgs.gitFull;

    settings = {
      user = {
        name = lib.mkDefault "Mohamed Elkebir"; # Git user name
        email = lib.mkDefault "mohamedelkebir85@gmail.com"; # Git user email
      };

      # TODO: Move aliases to shared config.
      aliases = {
        p = "pull --ff-only"; # Pull with fast-forward only
        ff = "merge --ff-only"; # Merge with fast-forward only
        graph = "log --decorate --oneline --graph"; # Graphical log view
        pushall = "!git remote | xargs -L1 git push --all";
        add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
      };

      init.defaultBranch = lib.mkDefault "main";

      merge.conflictStyle = lib.mkDefault "zdiff3";

      commit.verbose = lib.mkDefault true;

      diff.algorithm = lib.mkDefault "histogram";

      log.date = lib.mkDefault "iso";
      column.ui = lib.mkDefault "auto";
      branch.sort = lib.mkDefault "committerdate";
      # Automatically track remote branch
      push.autoSetupRemote = lib.mkDefault true;
      # Reuse merge conflict fixes when rebasing
      rerere.enabled = lib.mkDefault true;
    };

    lfs.enable = lib.mkDefault true;

    ignores = [
      ".direnv"
      "result"
      ".jj"
    ];
  };
}
