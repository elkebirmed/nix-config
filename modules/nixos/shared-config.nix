# ============================================================================
# Shared NixOS Configuration.
# These settings can be overridden by host-specific configurations.
# ============================================================================
{
  pkgs,
  lib,
  ...
}: {
  # Nix settings.
  nix = {
    settings = {
      # Enable experimental features for Nix.
      experimental-features = ["flakes" "nix-command"];

      # Optimize the Nix store automatically.
      auto-optimise-store = lib.mkDefault true;
    };

    # Automatic garbage collection.
    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "daily";
      # Keep generations from the past week
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  # Nixpkgs configuration.
  nixpkgs = {
    # TODO: Enable overlays.
    # overlays = builtins.attrValues outputs.overlays;

    config = {
      # Allow installation of unfree packages.
      allowUnfree = lib.mkDefault true;
    };
  };

  # Enable firmware with a license allowing redistribution.
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  # TTY console settings.
  console = {
    # Set the default font for the console.
    font = lib.mkDefault "Lat2-Terminus16";

    # Use X keyboard configuration.
    useXkbConfig = lib.mkDefault true;
  };

  # Determines the language for program messages,
  # the format for dates and times, sort order, and so on.
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  # Keyboard layout.
  services.xserver.xkb.layout = lib.mkDefault "us";

  # Handle input devices.
  services.libinput.enable = lib.mkDefault true;

  # Allow non-Nix Linux binaries.
  programs.nix-ld.enable = lib.mkDefault true;

  # Common system packages.
  environment.systemPackages = with pkgs; [
    vim # Editor
    git # Version control
    curl # Data transfer tool
    wget # Network downloader
    tree # Directory tree viewer
    ripgrep # Fast search tool
    htop # Interactive process viewer
    zip # File compression tool
    unzip # File decompression tool
    p7zip # 7z file archiver
    fd # Simple, fast and user-friendly alternative to 'find'
  ];
}
