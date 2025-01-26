{pkgs, ...}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # TODO: Try other kernel
  # TODO: Custumize bootloader
}
