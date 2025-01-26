# Specialized home-manager configuration for the current user
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Modules from `modules/home-manager` can be used here:
    # outputs.homeManagerModules.example

    # Modules from other flakes (e.g. nix-colors) can be used here:
    # inputs.nix-colors.homeManagerModules.default

    # Pieces of configuration can be split up into separate files:
    # ./nvim.nix
    ../../common/home.nix
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

  # Home definition
  home = {
    username = "mohamed";
    homeDirectory = "/home/mohamed";
  };

  # Programs
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      editor = "nvim";
    };
  };

  programs.vscode.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
