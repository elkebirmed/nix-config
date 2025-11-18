# ============================================================================
# Gaming specific configuration.
# ============================================================================
{lib, ...}: {
  # Enable GameMode.
  programs.gamemode.enable = lib.mkDefault true;

  # Enable Steam hardware optimizations.
  hardware.steam-hardware.enable = lib.mkDefault true;
}
