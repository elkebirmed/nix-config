{ pkgs, lib, ... }:
{
  programs.dconf.enable = true;
   programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.fish.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];
}
