# ============================================================================
# SDDM Display Manager.
# - https://github.com/sddm/sddm
# ============================================================================
{lib, ...}: {
  services.displayManager = {
    # Enable display manager.
    enable = lib.mkDefault true;

    sddm = {
      # Enable SDDM display manager.
      enable = lib.mkDefault true;

      # Enable NumLock on startup.
      autoNumlock = lib.mkDefault true;

      # Enable Wayland support (SDDM uses X11 by default).
      wayland.enable = lib.mkDefault true;
    };
  };
}
