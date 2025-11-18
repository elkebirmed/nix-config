# ============================================================================
# Shared Home Manager Configuration.
# These settings can be overridden by host-specific configurations.
# ============================================================================
{
  lib,
  config,
  ...
}: {
  # Nix settings.
  nix = {
    settings = {
      # Enable experimental features for Nix.
      experimental-features = ["flakes" "nix-command"];
    };
  };

  # Determines the necessary changes and automatically apply them.
  systemd.user.startServices = lib.mkDefault "sd-switch";

  # Enable Home Manager.
  programs.home-manager.enable = true;

  # Username (better be overridden in host-specific configurations).
  home.username = lib.mkDefault "mohamed";

  # Home directory path.
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  # Extra directories to prepend to PATH.
  home.sessionPath = ["$HOME/.local/bin"];

  # Environment variables for the session.
  home.sessionVariables = {
    NH_FLAKE = "$HOME/Projects/nix-config"; # Used by nh command
  };

  # State version for Home Manager (override it if necessary).
  #
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = lib.mkDefault "25.05";
}
