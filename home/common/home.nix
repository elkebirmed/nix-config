# Common home-manager configuration
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
  ];

  nixpkgs = {
    overlays = [
      # Overlays from overlays and pkgs dir can be added here:
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # Overlays from other flakes can be added here:
      # neovim-nightly-overlay.overlays.default

      # Inline overlays can be added here:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    # Nixpkgs configuration
    config = {
      allowUnfree = true;
    };
  };

  # Programs
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.alacritty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
	      sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, return, exec, alacritty"
        "$mainMod, b, exec, firefox"
        "$mainMod, Space, togglefloating"
        "$mainMod, q, killactive"
        "$mainMod, M, exit"
        "$mainMod, F, fullscreen"
        "$mainMod, J, togglesplit"
      ];
    };
  };


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
