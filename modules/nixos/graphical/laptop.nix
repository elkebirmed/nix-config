# ============================================================================
# Common Laptop Configuration.
# - https://wiki.nixos.org/wiki/Laptop
# ============================================================================
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./common.nix
  ];

  # Power management settings.
  services.logind.settings.Login = {
    # Suspend on lid close
    HandleLidSwitch = lib.mkDefault "suspend";

    # Lock the screen when lid is closed while on external power
    HandleLidSwitchExternalPower = lib.mkDefault "lock";
  };
}
