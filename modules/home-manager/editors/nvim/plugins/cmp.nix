# ============================================================================
# Neovim completions.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  ...
}: {
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true; # Enable nvim-cmp completion engine
        autoEnableSources = false; # Automatically enable registered sources
        settings = {
          sources = [
            {name = "codeium";} # Use Codeium as a completion source
            {name = "nvim_lsp";} # Use LSP as a completion source
            {name = "path";} # Enable filesystem path completion
            {name = "buffer";} # Offer words from current buffer
            {name = "luasnip";} # Use LuaSnip snippets as completion source
            {name = "cmp_yanky";} # Use Yanky as a completion source
            {name = "emoji";} # Use emoji as a completion source
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()"; # Trigger completion menu manually
            "<C-e>" = "cmp.mapping.abort()"; # Abort completion
            "<CR>" = "cmp.mapping.confirm({ select = true })"; # Confirm selection with Enter
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})"; # Tab cycles to next item
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})"; # Shift-Tab cycles to previous item
            "<C-b>" = "cmp.mapping.scroll_docs(-4)"; # Scroll documentation up
            "<C-f>" = "cmp.mapping.scroll_docs(4)"; # Scroll documentation down
          };
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end"; # Expand snippets via LuaSnip
        };
      };

      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp_yanky.enable = true;
      cmp-emoji.enable = true;

      cmp-ai = {
        enable = true; # Enable nvim-cmp-ai completion engine
        settings = {
          provider = "Codestral";
          run_on_every_keystroke = true;
          max_lines = 1000;
        };
      };
    };
  };
}
