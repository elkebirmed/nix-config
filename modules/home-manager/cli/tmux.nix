# ============================================================================
# Tmux - Terminal multiplexer.
# - https://github.com/tmux/tmux
# ============================================================================
{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    # Rebuild tmux to remove bash completion (which conflicts with fish).
    package = pkgs.tmux.overrideAttrs (old: {
      postInstall = lib.concatStringsSep "\n" (
        (lib.optional (old ? postInstall) old.postInstall)
        ++ [
          ''
            rm -f $out/share/bash-completion/completions/tmux
          ''
        ]
      );
    });

    enable = true;
    
    # Use fish as default shell
    shell = "${pkgs.fish}/bin/fish";
    
    # Enable mouse support
    mouse = true;
    
    # Start window numbering at 1
    baseIndex = 1;
    
    # Increase scrollback buffer
    historyLimit = 10000;
    
    # Enable true color support
    terminal = "tmux-256color";
    
    # Set prefix to Ctrl-x
    prefix = "C-x";
    
    # Custom key bindings
    extraConfig = ''
      # Unbind default prefix
      unbind C-b
      
      # Reload config with prefix + r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"
      
      # Split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      
      # Switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      
      # Don't rename windows automatically
      set-option -g allow-rename off
      
      # Enable vi mode
      set-window-option -g mode-keys vi
      
      # Copy mode bindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      
      # True color support
      set -ga terminal-overrides ",*256col*:Tc"
      
      # Status bar
      set -g status-position bottom
      set -g status-style 'bg=colour234 fg=colour137'
      set -g status-left ""
      set -g status-right '#[fg=colour233,bg=colour241] %d/%m #[fg=colour233,bg=colour245] %H:%M:%S '
      set -g status-right-length 50
      set -g status-left-length 20
      
      # Window status
      setw -g window-status-current-style 'fg=colour81 bg=colour238 bold'
      setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
      
      setw -g window-status-style 'fg=colour138 bg=colour235'
      setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '
    '';
    
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];
  };
}
