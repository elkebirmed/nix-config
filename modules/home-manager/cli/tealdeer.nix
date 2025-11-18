# ============================================================================
# Tealdeer - fast tldr.
# - https://github.com/tealdeer-rs/tealdeer
# ============================================================================
{ config, lib, pkgs, ... }:
{
  programs.tealdeer = {
    enable = true;
    
    settings = {
      # Display settings
      display = {
        compact = false;
        use_pager = false;
      };
      
      # Style
      style = {
        description = {
          foreground = "white";
        };
        command_name = {
          foreground = "cyan";
          bold = true;
        };
        example_text = {
          foreground = "green";
        };
        example_code = {
          foreground = "blue";
        };
        example_variable = {
          foreground = "yellow";
          underline = true;
        };
      };
      
      # Updates
      updates = {
        auto_update = true;
        auto_update_interval_hours = 168; # Weekly
      };
    };
  };
}
