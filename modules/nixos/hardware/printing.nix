# ============================================================================
# Printing support.
# - https://nixos.wiki/wiki/Printing
# ============================================================================
{lib, pkgs, ...}: {
  services.printing = {
    # Enable CUPS for printing.
    enable = lib.mkDefault true;
    
    # Drivers for various printers.
    drivers = with pkgs; [
      gutenprint # Common printer drivers
      hplip # HP printers
      splix # Samsung printers
      brlaser # Brother laser printers
      brgenml1lpr # Brother generic ML-1 series
      brgenml1cupswrapper # Brother CUPS wrapper
      canon-cups-ufr2 # Canon printers
    ];

    # Allow discovery of network printers.
    browsing = true;

    # Disable sharing by default.
    defaultShared = false;

    # Additional CUPS settings.
    # - Disable encryption for local printing.
    extraConf = ''
      DefaultEncryption Never
    '';
  };

  # Enable printer discovery.
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable SANE for scanner support.
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };
}
