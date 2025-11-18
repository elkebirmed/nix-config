# ============================================================================
# Fzf - Command-line fuzzy finder.
# - https://github.com/junegunn/fzf
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.fzf = {
    enable = lib.mkDefault true;
  };
}
