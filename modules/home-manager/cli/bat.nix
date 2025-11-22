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

    config = {
      # TODO: Use the color scheme defined in shared-config.nix.
      theme = "Monokai Extended";
    };
  };

  # Additional aliases for fish
  programs.fish.shellAliases = {
    cat = "bat";
  };
}
