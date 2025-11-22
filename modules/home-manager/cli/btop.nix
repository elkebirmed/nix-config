# ============================================================================
# Btop - System viewer.
# - https://github.com/aristocratos/btop
# ============================================================================
{
  lib,
  pkgs,
  config,
  ...
}: let
  theme = config.colorScheme;
in {
  programs.btop = {
    enable = lib.mkDefault true;

    settings = {
      color_theme = "tokyo-city-terminal-dark";
      theme_background = false;
      
      # Update settings
      update_ms = 1000;
      
      # Process settings
      proc_sorting = "cpu lazy";
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      
      # CPU settings
      cpu_graph_upper = "total";
      cpu_graph_lower = "total";
      
      # Show temperatures
      show_cpu_freq = true;
      check_temp = true;
      
      # Network settings
      net_download = "0";
      net_upload = "0";
      net_auto = true;
      
      # Disk settings
      show_disks = true;
      disk_free_priv = false;
      
      # Memory settings
      mem_graphs = true;
      mem_below_net = false;
      
      # UI settings
      rounded_corners = true;
      graph_symbol = "braille";
      shown_boxes = "cpu mem net proc";
    };
  };

  # Theme file.
  home.file.".config/btop/themes/tokyo-city-terminal-dark.theme".text = ''
    # Theme: tokyo-city-terminal-dark

    # Main background, empty for terminal default, need to be empty if you want transparent background
    theme[main_bg]="#${theme.palette.base00}"
    # Base

    # Main text color
    theme[main_fg]="#${theme.palette.base05}"
    # Text

    # Title color for boxes
    theme[title]="#${theme.palette.base04}"
    # Subtle

    # Highlight color for keyboard shortcuts
    theme[hi_fg]="#${theme.palette.base05}"
    # Text

    # Background color of selected item in processes box
    theme[selected_bg]="#${theme.palette.base07}"
    # HL High

    # Foreground color of selected item in processes box
    theme[selected_fg]="#${theme.palette.base09}"
    # Gold

    # Color of inactive/disabled text
    theme[inactive_fg]="#${theme.palette.base02}"
    # HL Med

    # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
    theme[graph_text]="#${theme.palette.base0C}"
    # Foam

    # Background color of the percentage meters
    theme[meter_bg]="#${theme.palette.base0C}"
    # Foam

    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
    theme[proc_misc]="#${theme.palette.base0D}"
    # Iris

    # Cpu box outline color
    theme[cpu_box]="#${theme.palette.base0A}"
    # Rose

    # Memory/disks box outline color
    theme[mem_box]="#${theme.palette.base0B}"
    # Pine

    # Net up/down box outline color
    theme[net_box]="#${theme.palette.base0D}"
    # Iris

    # Processes box outline color
    theme[proc_box]="#${theme.palette.base08}"
    # Love

    # Box divider line and small boxes line color
    theme[div_line]="#${theme.palette.base03}"
    # Muted

    # Temperature graph colors
    theme[temp_start]="#${theme.palette.base0A}"
    # Rose
    theme[temp_mid]="#${theme.palette.base09}"
    # Gold
    theme[temp_end]="#${theme.palette.base08}"
    # Love

    # CPU graph colors
    theme[cpu_start]="#${theme.palette.base09}"
    # Gold
    theme[cpu_mid]="#${theme.palette.base0A}"
    # Rose
    theme[cpu_end]="#${theme.palette.base08}"
    # Love

    # Mem/Disk free meter
    # all love
    theme[free_start]="#${theme.palette.base08}"
    theme[free_mid]="#${theme.palette.base08}"
    theme[free_end]="#${theme.palette.base08}"

    # Mem/Disk cached meter
    # all iris
    theme[cached_start]="#${theme.palette.base0D}"
    theme[cached_mid]="#${theme.palette.base0D}"
    theme[cached_end]="#${theme.palette.base0D}"

    # Mem/Disk available meter
    # all pine
    theme[available_start]="#${theme.palette.base0B}"
    theme[available_mid]="#${theme.palette.base0B}"
    theme[available_end]="#${theme.palette.base0B}"

    # Mem/Disk used meter
    # all rose
    theme[used_start]="#${theme.palette.base0A}"
    theme[used_mid]="#${theme.palette.base0A}"
    theme[used_end]="#${theme.palette.base0A}"

    # Download graph colors
    # Pine for start, foam for the rest
    theme[download_start]="#${theme.palette.base0B}"
    theme[download_mid]="#${theme.palette.base0C}"
    theme[download_end]="#${theme.palette.base0C}"

    # Upload graph colors
    theme[upload_start]="#${theme.palette.base0A}"
    # Rose for start
    theme[upload_mid]="#${theme.palette.base08}"
    # Love for mid and end
    theme[upload_end]="#${theme.palette.base08}"

    # Process box color gradient for threads, mem and cpu usage
    theme[process_start]="#${theme.palette.base0B}"
    # Pine
    theme[process_mid]="#${theme.palette.base0C}"
    # Foam for mid and end
    theme[process_end]="#${theme.palette.base0C}"
  '';
}
