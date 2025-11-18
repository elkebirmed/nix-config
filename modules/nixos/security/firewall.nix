# ============================================================================
# Firewall configuration.
# - https://wiki.nixos.org/wiki/Firewall
# ============================================================================
{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  networking.firewall = {
    enable = lib.mkDefault true;

    # Allow common services.
    allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
    ];

    # Allow specific UDP ports.
    allowedUDPPorts = [ 
      53 # DNS
    ];

    # Allow specific TCP port ranges.
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];

    # Allow specific UDP port ranges.
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];

    # Allow ping
    allowPing = lib.mkDefault true;
    
    # Log refused connections
    logRefusedConnections = lib.mkDefault false;
    
    # Log refused packets
    logRefusedPackets = lib.mkDefault false;
  };
}
