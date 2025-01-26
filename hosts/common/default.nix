# Common system's configuration
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
    inputs.nix-flatpak.nixosModules.nix-flatpak

    # Pieces of configuration can be split up into separate files:
    # ./users.nix
    ./bootloader.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    # TODO: ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./locale.nix
    ./flatpak.nix
    ./wayland.nix
    # TODO: ./virtualization.nix
  ];

  nixpkgs = {
    overlays = [
      # Overlays from overlays and pkgs dir can be added here:
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # Overlays from other flakes can be added here:
      # neovim-nightly-overlay.overlays.default
      inputs.nur.overlays.default

      # Inline overlays can be added here:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
  };
}
