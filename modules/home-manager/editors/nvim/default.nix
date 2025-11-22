# ============================================================================
# Neovim.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  outputs,
  ...
}: let
  theme = config.colorScheme;
in {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./autocmd.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true; # Enable the Neovim configuration module
    defaultEditor = true; # Use Neovim as the default editor
    viAlias = true; # Provide the vi command as an alias to Neovim
    vimAlias = true; # Provide the vim command as an alias to Neovim
    vimdiffAlias = true; # Provide the vimdiff command as an alias to Neovim
    enableMan = true; # Install the man pages for NixVim options
    enablePrintInit = true; # A tool that shows the generated init.lua file

    # Tokyo City Terminal Dark colorscheme.
    colorschemes.base16 = {
      enable = true; # Enable the Base16 colorscheme integration

      # Apply theme palette as hex colors.
      colorscheme = lib.mapAttrs (name: value: "#" + value) theme.palette;
    };

    diagnostic.settings = {
      virtual_text = {
        prefix = "●";
      };
      underline = true;
      update_in_insert = false;
      severity_sort = true;
      float = {
        border = "rounded";
        source = "always";
      };
    };

    # Extra configuration
    extraConfigLua = ''
      vim.opt.diffopt:append("vertical") -- Vertical diff splits
      vim.opt.diffopt:append("algorithm:patience") -- Better diff algorithm
      vim.opt.diffopt:append("linematch:60") -- Better diff highlighting (smart line matching)
      vim.opt.iskeyword:append("-") -- Treat dash as part of a word

      -- LSP handlers
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
      )

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'rounded' }
      )
    '';
  };
}
