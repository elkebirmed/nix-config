{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "fr,ara";
      xkb.variant = ",azerty";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
