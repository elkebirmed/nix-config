# ============================================================================
# Home Manager Configuration for Mohamed in crazy host.
# ============================================================================
{
  outputs,
  config,
  ...
}: {
  imports = [
    outputs.homeManagerModules.shared-config # Shared configurations
    outputs.homeManagerModules.sops # Sops
    outputs.homeManagerModules.vcs # Version control systems
    outputs.homeManagerModules.cli # Command-line tools
    outputs.homeManagerModules.nvim # Neovim
    outputs.homeManagerModules.xdg # XDG dirs & MIME types
    outputs.homeManagerModules.hyprland # Hyprland
  ];

  # Git settings.
  programs.git.settings.user = {
    name = "Mohamed Elkebir"; # Git user name
    email = "mohamedelkebir85@gmail.com"; # Git user email
  };

  # Username.
  home.username = "mohamed";

  # Session variables.
  home.sessionVariables = {
    "CODESTRAL_API_KEY" = "$(cat ${config.sops.secrets.codestral_api_key.path})";
  };

  # State version for Home Manager. Do not change this unless you know what
  # you are doing.
  home.stateVersion = "25.05";
}
