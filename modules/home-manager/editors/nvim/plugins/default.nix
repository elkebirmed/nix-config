# ============================================================================
# Neovim plugins.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./snacks.nix
  ];

  programs.nixvim = {
    plugins = {
      # Enable devicons for UI elements.
      web-devicons.enable = true;

      # File explorer.
      nvim-tree = {
        enable = true;
        openOnSetup = false; # Do not auto-open tree on startup
        settings = {
          auto_reload_on_write = true; # Reload tree when files change
          sort_by = "case_sensitive"; # Sort entries case-sensitively
          view = {
            width = 30; # Set tree window width
            side = "left"; # Anchor tree on the left side
          };
          renderer = {
            group_empty = true; # Group empty directories together
          };
          filters = {
            dotfiles = false; # Show dotfiles in the tree
          };
        };
      };

      # Fuzzy finder.
      # telescope = {
      #   enable = true; # Enable Telescope fuzzy finder
      #   extensions = {
      #     fzf-native.enable = true; # Enable native FZF Telescope extension
      #     ui-select.enable = true; # Enable UI select Telescope extension
      #     manix.enable = true; # Enable manix Telescope extension
      #     media-files.enable = true; # Enable media files Telescope extension
      #   };
      #   settings = {
      #     defaults = {
      #       mappings = {
      #         # i = {
      #         #   "<C-u>" = false; # Disable default Ctrl+U mapping in insert mode
      #         #   "<C-d>" = false; # Disable default Ctrl+D mapping in insert mode
      #         # };
      #       };
      #     };
      #   };
      # };

      # Statusline.
      lualine = {
        enable = true; # Enable lualine statusline
        settings.sections = {
          lualine_a = ["mode"]; # Show current mode in section A
          lualine_b = ["branch" "diff" "diagnostics"]; # Show git and diagnostics info in section B
          lualine_c = ["filename"]; # Display filename in section C
          lualine_x = ["encoding" "fileformat" "filetype"]; # Show file encoding/format/type in section X
          lualine_y = ["progress"]; # Show progress through file in section Y
          lualine_z = ["location"]; # Show cursor location in section Z
        };
      };

      # Git integration.
      gitsigns = {
        enable = true; # Enable Git signs in sign column
        settings = {
          signs = {
            add = {text = "│";}; # Glyph for added lines
            change = {text = "│";}; # Glyph for modified lines
            delete = {text = "_";}; # Glyph for deleted lines
            topdelete = {text = "‾";}; # Glyph for top-line deletions
            changedelete = {text = "~";}; # Glyph for changed and deleted lines
            untracked = {text = "┆";}; # Glyph for untracked lines
          };
        };
      };

      lazygit.enable = true; # Enable LazyGit integration

      # Snippets
      luasnip.enable = true; # Enable LuaSnip snippet engine

      # Treesitter
      treesitter = {
        enable = true; # Enable Treesitter for better parsing
        nixGrammars = true; # Include Nix grammar support
        settings = {
          highlight.enable = true; # Enable Treesitter-based highlighting
          indent.enable = true; # Enable Treesitter-based indentation
          incremental_selection = {
            enable = true; # Enable incremental selection
            keymaps = {
              init_selection = "<C-space>"; # Start incremental selection
              node_incremental = "<C-space>"; # Expand selection to next node
              scope_incremental = false; # Disable scope incremental selection
              node_decremental = "<bs>"; # Shrink selection to previous node
            };
          };
        };
      };

      # Yanky.
      yanky = {
        enable = true; # Enable Yanky clipboard manager
      };

      # Autopairs
      nvim-autopairs.enable = true; # Enable automatic bracket pairing

      # Comments
      comment.enable = true; # Enable easy commenting plugin

      # Surround
      nvim-surround.enable = true; # Enable surround text manipulation

      # Indent guides
      indent-blankline = {
        enable = true; # Enable indent-blankline indentation guides
        settings = {
          indent.char = "│"; # Use vertical bar for indent marker
          scope.enabled = true; # Enable scope highlighting
        };
      };

      # Terminal
      toggleterm = {
        enable = true; # Enable ToggleTerm terminal manager
        settings = {
          direction = "float"; # Launch terminal in floating window
          float_opts = {
            border = "curved"; # Use curved border for floating terminal
          };
        };
      };

      # Which-key
      which-key = {
        enable = true; # Enable which-key keybinding helper
      };

      # Dashboard
      alpha = {
        enable = true; # Enable alpha dashboard
        settings = {
          layout = [
            {
              type = "padding"; # Add vertical padding at top
              val = 2; # Use two lines of padding
            }
            {
              type = "text"; # Display ASCII art header
              val = [
                "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
                "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
                "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
                "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
                "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
                "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
              ];
              opts = {
                position = "center"; # Center the header text
                hl = "Type"; # Use Type highlight group for header
              };
            }
          ];
        };
      };

      # Notifications
      fidget.enable = true; # Enable fidget LSP notification UI

      # Trouble. TODO: Configure
      trouble.enable = true; # Enable Trouble diagnostics viewer

      # Todo comments
      todo-comments.enable = true; # Highlight todo & fixme comments

      colorizer = {
        enable = true; # Enable colorizer
      };

      windsurf-nvim = {
        enable = true; # Enable Windsurf
        settings = {
          enaable_chat = true;
        };
      };
    };
  };
}
