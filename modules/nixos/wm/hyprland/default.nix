# ============================================================================
# Hyprland window manager.
# - https://nixos.wiki/wiki/Hyprland
# - https://wiki.hypr.land/Nix/
# ============================================================================
{
  programs.hyprland = {
    # Enable Hyprland window manager.
    enable = true;

    # XWayland support for interfacing X11 apps with the Wayland protocol.
    xwayland.enable = true;
  };

  # Authentication.
  security.pam.services = {
    swaylock = {};
    hyprlock = {};
  };
}
