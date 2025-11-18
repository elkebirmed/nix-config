# ============================================================================
# SOPS - Secrets OPerationS
# - https://github.com/Mic92/sops-nix
# ============================================================================
{
  inputs,
  config,
  pkgs,
  ...
}: let
  isEd25519 = k: k.type == "ed25519";
  getKeyPath = k: k.path;
  keys = builtins.filter isEd25519 config.services.openssh.hostKeys;
in {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = {
    # Configure SOPS to use SSH host keys as age decryption keys.
    age.sshKeyPaths = map getKeyPath keys;

    # Default SOPS file for the host.
    defaultSopsFile = ../../../hosts/${config.networking.hostName}/secrets.yaml;
  };

  # Secrets.
  sops.secrets = {
    hello = {};
  };

  # Needed system packages.
  environment.systemPackages = with pkgs; [
    age # Simple, modern and secure file encryption
    ssh-to-age # Convert SSH keys to age format
    sops # Secrets management tool
  ];
}
