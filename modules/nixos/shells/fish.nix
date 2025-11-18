# ============================================================================
# Fish shell.
# - https://wiki.nixos.org/wiki/Fish
# - https://fishshell.com/
# ============================================================================
{lib, ...}: {
  programs.fish = {
    # Enable Fish shell.
    enable = lib.mkDefault true;

    vendor = {
      # Enable Fish shell completions.
      completions.enable = lib.mkDefault true;

      # Source configuration snippets provided by other packages.
      config.enable = lib.mkDefault true;

      # Autoload fish functions provided by other packages.
      functions.enable = lib.mkDefault true;
    };
  };
}
