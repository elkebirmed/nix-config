# ============================================================================
# Btop - System viewer.
# - https://github.com/aristocratos/btop
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = lib.mkDefault true;

    settings = {
      color_theme = "Default";
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
}
