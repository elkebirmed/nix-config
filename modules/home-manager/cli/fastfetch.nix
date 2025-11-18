# ============================================================================
# Fastfetch - Fast system information tool.
# - https://github.com/fastfetch-cli/fastfetch
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = lib.mkDefault true;
  };
}
