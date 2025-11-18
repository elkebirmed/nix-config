# ============================================================================
# Zoxide configuration for efficient directory navigation.
# - https://github.com/ajeetdsouza/zoxide
# ============================================================================
{ config, lib, pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    
    options = [
      "--cmd cd"  # Use 'cd' instead of 'z'
    ];
  };
}