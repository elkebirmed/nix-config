# ============================================================================
# SOPS - Secrets OPerationS (Home Manager)
# - https://github.com/Mic92/sops-nix
# ============================================================================
{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # User's private age key.
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    # Default SOPS file for the user.
    defaultSopsFile = ../../../home/${config.home.username}/secrets.yaml;
  };

  # Secrets.
  sops.secrets = {
    hello = {};
  };
}
