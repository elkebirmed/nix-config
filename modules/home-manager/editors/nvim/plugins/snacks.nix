# ============================================================================
# Neovim snacks.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      snacks = {
        enable = true; # Enable snacks

        settings = {
          animate = {
            enabled = true;
          };
          bigfile = {
            enabled = true;
          };
          notifier = {
            enabled = true;
            timeout = 3000;
          };
          picker = {
            enabled = true;
          };
          scroll = {
            enabled = false;
          };
          words = {
            debounce = 100;
            enabled = true;
          };
        };
      };
    };
  };
}
