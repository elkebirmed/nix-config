# ============================================================================
# Podman container management.
# - https://wiki.nixos.org/wiki/Podman
# - https://docs.podman.io/en/latest/
# ============================================================================
{
  config,
  lib,
  ...
}: let
  dockerEnabled = config.virtualisation.docker.enable;
in {
  virtualisation.podman = {
    # Enable Podman service.
    enable = lib.mkDefault true;

    # Disable Docker compatibility and socket if Docker is enabled.
    dockerCompat = !dockerEnabled;

    # Disable Docker socket if Docker is enabled.
    dockerSocket.enable = !dockerEnabled;

    # Enable DNS support in Podman network.
    defaultNetwork.settings.dns_enabled = true;
  };
}
