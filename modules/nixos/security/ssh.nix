# ============================================================================
# SSH Service.
# - https://wiki.nixos.org/wiki/SSH
# ============================================================================
{
  pkgs,
  lib,
  ...
}: {
  services.openssh = {
    enable = lib.mkDefault true;

    settings = {
      # Disable root login for security.
      PermitRootLogin = lib.mkDefault "no";

      # Disable password authentication to enforce key-based auth.
      PasswordAuthentication = lib.mkDefault false;

      # Automatically remove stale sockets.
      StreamLocalBindUnlink = lib.mkDefault "yes";

      # Allow forwarding WAYLAND_DISPLAY.
      AcceptEnv = lib.mkDefault "WAYLAND_DISPLAY";

      # Enable running graphical apps over SSH.
      X11Forwarding = lib.mkDefault true;
    };
  };

  # Allow SSH port through firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
}
