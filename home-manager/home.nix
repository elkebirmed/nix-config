# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # TODO: Set your username
  home = {
    username = "mohamed";
    homeDirectory = "/home/mohamed";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
      editor = "nvim";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "fr";
	follow_mouse = 1;
	touchpad = {
          natural_scroll = true;
	};
	sensitivity = 0;
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, return, exec, kitty"
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
