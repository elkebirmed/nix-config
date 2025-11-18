# ============================================================================
# Bat - Cat alternative.
# - https://github.com/sharkdp/bat
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.bat = {
    enable = lib.mkDefault true;
  };

  # Additional aliases for fish
  programs.fish.shellAliases = {
    cat = "bat";
  };
}
