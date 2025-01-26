# System's configuration
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Modules from 'modules/nixos' can be used here:
    # outputs.nixosModules.example

    # Modules from other flakes (e.g. nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # Pieces of configuration can be split up into separate files:
    # ./users.nix

    # Hardware configuration (Auto generated by nixos-hardware)
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      # Overlays from overlays and pkgs dir can be added here:
      # outputs.overlays.additions

      # Overlays from other flakes can be added here:
      # neovim-nightly-overlay.overlays.default

      # Inline overlays can be added here:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
  };

  # Hostname
  networking.hostName = "crazy";

  # Users
  users = {
    defaultUserShell = pkgs.fish;

    users = {
      mohamed = {
        isNormalUser = true;

        # This is an inital password, it will be changed on first login (use passwd)
        initialPassword = "thisisapassword";

        # Public SSH keys
        openssh.authorizedKeys.keys = [];

        # Groups to join (such as networkmanager, audio, docker, etc)
        extraGroups = ["wheel" "networkmanager" ];
      };
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
