# ============================================================================
# Home Manager Modules.
# ============================================================================
{
  # Shared configurations across multiple Home Manager hosts.
  shared-config = import ./shared-config.nix;

  # Sops.
  sops = import ./security/sops.nix;

  # Command-line tools configurations.
  cli = import ./cli;

  # XDG dirs & MIME types.
  xdg = import ./misc/xdg.nix;

  # Version control systems.
  vcs = import ./vcs;

  # Desktop environment configurations.
  hyprland = import ./graphical/hyprland;
}
