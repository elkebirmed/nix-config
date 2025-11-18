# ============================================================================
# Systemd Bootloader.
# - https://wiki.nixos.org/wiki/Systemd/boot
# ============================================================================
{lib, ...}: {
  boot.loader = {
    # systemd-boot is a simple UEFI boot manager.
    # It is the recommended bootloader to use with NixOS.
    systemd-boot.enable = lib.mkDefault true;

    # Allow to modify EFI boot variables.
    efi.canTouchEfiVariables = lib.mkDefault true;
  };
}
