# ============================================================================
# Neovim Autocommands.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  ...
}: {
  programs.nixvim = {
    autoCmd = [
      # Highlight on yank.
      {
        event = ["TextYankPost"]; # Trigger when text is yanked
        pattern = ["*"]; # Apply to all file patterns
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        }; # Use Lua callback to highlight yanked text
      }

      # Remove trailing whitespace on save.
      {
        event = ["BufWritePre"]; # Trigger before saving buffer
        pattern = ["*"]; # Apply to all files
        command = "%s/\\s\\+$//e"; # Strip trailing whitespace quietly
      }

      # Auto-format on save using LSP.
      {
        event = ["BufWritePre"]; # Trigger before saving buffer
        pattern = ["*"]; # Apply to all files
        callback = {
          __raw = ''
            function()
              vim.lsp.buf.format({ async = false })
            end
          '';
        }; # Format buffer using LSP before saving
      }

      # Restore cursor position.
      {
        event = ["BufReadPost"]; # Trigger after reading file into buffer
        pattern = ["*"]; # Apply to all buffers
        callback = {
          __raw = ''
            function()
              if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.fn.setpos(".", vim.fn.getpos("'\""))
                vim.cmd("silent! foldopen")
              end
            end
          '';
        }; # Use Lua callback to restore last cursor position
      }
    ];
  };
}
