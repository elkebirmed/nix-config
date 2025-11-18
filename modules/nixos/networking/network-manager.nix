# ============================================================================
# Network Manager.
# - https://wiki.nixos.org/wiki/NetworkManager
# ============================================================================
{lib, ...}: {
  networking = {
    networkmanager = {
      enable = lib.mkDefault true;
    };
  };
}
