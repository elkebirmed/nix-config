# ============================================================================
# XDG directories and MIME types.
# ============================================================================
{ config, lib, pkgs, ... }:
{
  xdg = {
    enable = true;
    
    userDirs = {
      enable = true;
      createDirectories = true;
      
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Templates";
      videos = "${config.home.homeDirectory}/Videos";
      # TODO: Ensure those directories are created.
      # projects = "${config.home.homeDirectory}/Projects";
      # audio = "${config.home.homeDirectory}/Audio";
    };
    
    mimeApps = {
      enable = true;
      
      defaultApplications = {
        "text/html" = lib.mkDefault "firefox.desktop";
        "x-scheme-handler/http" = lib.mkDefault "firefox.desktop";
        "x-scheme-handler/https" = lib.mkDefault "firefox.desktop";
        "x-scheme-handler/about" = lib.mkDefault "firefox.desktop";
        "x-scheme-handler/unknown" = lib.mkDefault "firefox.desktop";
        
        "application/pdf" = lib.mkDefault "org.pwmt.zathura.desktop";
        
        "image/png" = lib.mkDefault "imv.desktop";
        "image/jpeg" = lib.mkDefault "imv.desktop";
        "image/jpg" = lib.mkDefault "imv.desktop";
        "image/gif" = lib.mkDefault "imv.desktop";
        "image/webp" = lib.mkDefault "imv.desktop";
        
        "video/mp4" = lib.mkDefault "mpv.desktop";
        "video/x-matroska" = lib.mkDefault "mpv.desktop";
        "video/webm" = lib.mkDefault "mpv.desktop";
        
        "audio/mpeg" = lib.mkDefault "mpv.desktop";
        "audio/flac" = lib.mkDefault "mpv.desktop";
        "audio/x-wav" = lib.mkDefault "mpv.desktop";
        
        "text/plain" = lib.mkDefault "nvim.desktop";
        "text/markdown" = lib.mkDefault "nvim.desktop";
        
        "inode/directory" = lib.mkDefault "org.gnome.Nautilus.desktop";
      };
    };
    
    configFile = {
      # Electron flags for Wayland support
      "electron-flags.conf".text = ''
        --enable-features=UseOzonePlatform
        --ozone-platform=wayland
        --enable-wayland-ime
      '';
    };
  };
  
  # Set environment variables for XDG compliance
  home.sessionVariables = {
    # Respect XDG Base Directory
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    DOCKER_CONFIG = "${config.xdg.configHome}/docker";
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/node_repl_history";
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
    PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    WGETRC = "${config.xdg.configHome}/wget/wgetrc";
  };
}
