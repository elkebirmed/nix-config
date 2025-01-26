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

    # Nixpkgs configuration
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";

      # Disable global registry
      flake-registry = "";

      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;

      allowed-users = [ "mohamed" ];
    };

    # Disable channels
    channel.enable = false;

    # Make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # Netowrking
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

  # environment.systemPackages = with pkgs; [ networkmanagerapplet ];
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    pulseaudioFull
    tree
    wget
    curl
    neovim
    git
  ];

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # lowLatency.enable = true;
  };
  #environment.systemPackages = with pkgs; [ pulseaudioFull ];

  programs.dconf.enable = true;
   programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];

  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };

  services = {
    gvfs.enable = true;
    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };
    dbus.enable = true;
    fstrim.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  # Localization
  time.timeZone = "Africa/Algiers";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Programs
  programs.fish.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  # environment.systemPackages = with pkgs; [
  #   tree
  #   wget
  #   curl
  #   neovim
  #   git
  # ];

  # Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage =
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      # inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
      # pkgs.xdg-desktop-portal-hyprland
    ];
  };

  services = {
    xserver = {
      enable = true;
      xkb.layout = "fr,ar";
    };

    displayManager.autoLogin = {
      enable = true;
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";

  # Console
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  # SSH server setup
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only.
      PasswordAuthentication = false;
    };
  };

  services.flatpak = {
    enable = true;
    packages = [
      # "io.github.zen_browser.zen"
      "com.github.tchx84.Flatseal"
      "io.github.everestapi.Olympus"
    ];
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        (vaapiIntel.override { enableHybridCodec = true; })
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
