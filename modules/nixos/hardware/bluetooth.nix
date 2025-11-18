# ============================================================================
# Bluetooth support.
# - https://nixos.wiki/wiki/Bluetooth
# ============================================================================
{lib, ...}: {
  hardware.bluetooth = {
    enable = lib.mkDefault true;

    # Power on Bluetooth on boot.
    powerOnBoot = lib.mkDefault true;
    
    settings = {
      General = {
        # Enable all Bluetooth profiles.
        Enable = lib.mkDefault "Source,Sink,Media,Socket";

        # Enable experimental features.
        Experimental = lib.mkDefault true;
      };
    };
  };
  
  # Bluetooth management service
  services.blueman.enable = lib.mkDefault true;
}
