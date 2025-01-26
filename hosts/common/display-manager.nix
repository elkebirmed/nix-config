{pkgs, ...}:
{
  services.display-manager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
  };
}
