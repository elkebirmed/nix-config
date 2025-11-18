# ============================================================================
# Direnv - Environment switcher for the shell.
# - https://direnv.net/
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.direnv = {
    enable = lib.mkDefault true;

    # Enable integration with Nix.
    nix-direnv.enable = lib.mkDefault true;
  };
}
