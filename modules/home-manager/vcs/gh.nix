# ============================================================================
# GitHub CLI.
# - https://cli.github.com/
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.gh = {
    enable = lib.mkDefault true;

    # GH CLI extensions.
    extensions = with pkgs; [gh-markdown-preview];

    settings = {
      version = "1"; # Use version 1 settings schema
      git_protocol = "ssh"; # Use SSH for git operations
      prompt = "enabled"; # Enable command prompts
    };
  };
}
