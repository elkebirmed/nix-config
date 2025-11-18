# ============================================================================
# Common Graphical Configuration.
# ============================================================================
{
  pkgs,
  lib,
  ...
}: {
  # PowerTOP for power management.
  powerManagement.powertop.enable = lib.mkDefault true;

  # DBus service that provides power management support to applications.
  services.upower.enable = lib.mkDefault true;

  # Power management settings.
  services.logind.settings.Login = {
    # Suspend on power key press
    HandlePowerKey = lib.mkDefault "suspend";

    # Power off on long press
    HandlePowerKeyLongPress = lib.mkDefault "poweroff";
  };

  # Location provider for geolocation services.
  location.provider = lib.mkDefault "geoclue2";

  # Enable graphics support.
  hardware.graphics.enable = lib.mkDefault true;

  # Enable 32-bit graphics support for compatibility.
  hardware.graphics.enable32Bit = lib.mkDefault true;

  # Light backlight control command
  # and udev rules granting access to members of the "video" group.
  programs.light.enable = lib.mkDefault true;

  # Android Debug Bridge (adb).
  programs.adb.enable = lib.mkDefault true;

  # Dconf for managing Gnome settings.
  programs.dconf.enable = lib.mkDefault true;

  # Common system packages.
  environment.systemPackages = with pkgs; [
    brightnessctl # Backlight control tool
  ];
}
