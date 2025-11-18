# ============================================================================
# Ripgrep - search tool
# - https://github.com/BurntSushi/ripgrep
# ============================================================================
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
  ];
  
  # Ripgrep configuration
  home.file.".config/ripgrep/ripgreprc".text = ''
    # Search hidden files and directories
    --hidden
    
    # Follow symbolic links
    --follow
    
    # Use smart case (case-insensitive unless pattern has uppercase)
    --smart-case
    
    # Ignore patterns
    --glob=!.git/*
    --glob=!node_modules/*
    --glob=!.cache/*
    --glob=!*.lock
  '';
  
  home.sessionVariables = {
    RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/ripgreprc";
  };
}