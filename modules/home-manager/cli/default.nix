# ============================================================================
# CLI tools.
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./fish
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./eza.nix
    ./fastfetch.nix
    ./fzf.nix
    ./nix-index.nix
    ./ripgrep.nix
    ./tealdeer.nix
    ./tmux.nix
    ./zoxide.nix
  ];

  # Enable bash shell.
  programs.bash.enable = lib.mkDefault true;

  # Fish aliases.
  programs.fish.shellAliases = {
    fdf = "fd --hidden --follow";
  };

  # CLI packages.
  home.packages = with pkgs; [
    comma # Install and run programs by sticking a , before them
    distrobox # Use any linux distribution inside your terminal

    bc # Calculator
    dua # better du
    fd # Better find
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    timer # Better sleep
    viddy # Better watch

    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt-rfc-style # Nix formatter (RFC style)
    nvd # Nix/NixOS package version diff tool
    nix-diff # Diff tool, more detailed
    nix-output-monitor # Processes output of Nix commands
    nh # Nice wrapper for NixOS and HM
    manix # Nix search tool
  ];
}
