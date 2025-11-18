# ============================================================================
# Eza - modern replacement for 'ls'
# - https://github.com/eza-community/eza
# ============================================================================
{ config, lib, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableFishIntegration = true;

    git = true; # Show git status
    icons = "auto"; # Show icons
    
    # Additional options for a better listing experience.
    extraOptions = [
      "--classify" # Show file types
      "--group-directories-first" # Group directories first
      "--header" # Show header with column names
    ];
  };

  # Additional aliases for fish
  programs.fish.shellAliases = {
    ls = "eza"; # Use eza as default ls
    l = "eza -l"; # Long format
    la = "eza -la"; # Long format with hidden files
    lt = "eza -aT"; # Tree view
    ltl = "eza -alT"; # Tree view with all files
    lt2 = "eza -aT -L 2"; # Tree view, 2 levels deep
    ltl2 = "eza -alT -L 2"; # Tree view with all files, 2 levels deep
    lt3 = "eza -aT -L 3"; # Tree view, 3 levels deep
    ltl3 = "eza -alT -L 3"; # Tree view with all files, 3 levels deep
    lt4 = "eza -aT -L 4"; # Tree view, 4 levels deep
    ltl4 = "eza -alT -L 4"; # Tree view with all files, 4 levels deep
    lm = "eza -la -s modified"; # Sort by modification time
    lz = "eza -laf -s size"; # Sort by size
    lr = "eza -aR"; # Recursive listing
  };
}