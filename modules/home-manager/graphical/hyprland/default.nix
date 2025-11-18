# ============================================================================
# Hyprland window manager.
# - https://wiki.nixos.org/wiki/Hyprland
# - https://wiki.hypr.land/Nix/
# ============================================================================
{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../wayland
    ../common

    #./basic-binds.nix
    #./hyprbars.nix
    #./hyprlock.nix
    #./hypridle.nix
    #./hyprpaper.nix
  ];

  home.pointerCursor.hyprcursor.enable = true;

  xdg.portal = {
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    config.hyprland = {
      default = ["hyprland" "gtk"];
    };
  };

  home.packages = [
    pkgs.grimblast
    pkgs.hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd = {
      enable = true;
      # Same as default, but stop graphical-session too
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
      variables = [
        "DISPLAY"
        "HYPRLAND_INSTANCE_SIGNATURE"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    };

    importantPrefixes = [
      "$"
      "bezier"
      "name"
      "source"
      "exec-once"
    ];

    settings = {
      input = {
        kb_layout = "fr,ara";
        touchpad = {
          disable_while_typing = false;
          natural_scroll = true;
        };
      };
    };
    # This is order sensitive, so it has to come here.
    extraConfig = ''
      # Passthrough mode (e.g. for VNC)
      bind=SUPER,P,submap,passthrough
      submap=passthrough
      bind=SUPER,P,submap,reset
      submap=reset
    '';
  };
}
