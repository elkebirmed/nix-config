{ pkgs, ... }:
{
  networking = {
    # Network Manager
    networkmanager.enable = true;

    # DNS
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];

    # Firewall
    firewall = {
      enable = true;

      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
      ];

      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
