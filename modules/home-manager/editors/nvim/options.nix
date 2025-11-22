# ============================================================================
# Neovim options.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  config,
  inputs,
  lib,
  ...
}: let
  theme = config.colorScheme;
in {
  programs.nixvim = {
    opts = {
      # Line numbers.
      number = true; # Show absolute line numbers
      relativenumber = true; # Show relative line numbers

      # Tabs and indentation.
      tabstop = 2; # Number of spaces that a <Tab> counts for
      softtabstop = 2; # Number of spaces that a <Tab> counts for in insert mode
      shiftwidth = 2; # Number of spaces that a <Tab> counts for in insert mode
      expandtab = true; # Convert tabs to spaces
      autoindent = true; # Copy indent from previous line
      smartindent = true; # Smart indentation

      # Line wrapping.
      wrap = false; # Disable soft line wrapping
      linebreak = true; # Wrap long lines at convenient points

      # Search.
      ignorecase = true; # Ignore case when searching
      smartcase = true; # Override ignorecase when search contains capitals
      hlsearch = true; # Highlight search matches
      incsearch = true; # Show incremental search results

      # Appearance.
      termguicolors = true; # Enable true color support
      background = theme.variant; # Use the variant if the theme
      signcolumn = "yes"; # Always display the sign column
      colorcolumn = "100"; # Highlight the 100th column
      cursorline = true; # Highlight the current line
      scrolloff = 8; # Keep eight lines visible above/below cursor
      sidescrolloff = 8; # Keep eight columns visible left/right of cursor
      cmdheight = 1; # Command line height
      showmatch = true; # Highlight matching brackets
      matchtime = 2; # Highlight matching brackets for 2ms
      winborder = "rounded"; # Use rounded window borders

      # Behavior.
      mouse = "a"; # Enable mouse support in all modes
      clipboard = "unnamedplus"; # Use the system clipboard
      splitright = true; # Open vertical splits to the right
      splitbelow = true; # Open horizontal splits below
      swapfile = false; # Disable swap files
      backup = false; # Disable backup files
      undofile = true; # Persist undo history across sessions
      undodir = "${config.home.homeDirectory}/.vim/undodir"; # Directory for undo history files
      spelllang = ["en" "fr" "ar"]; # Spell languages
      grepprg = "rg --vimgrep"; # Use ripgrep for grepping
      grepformat = "%f:%l:%c:%m"; # filename, line number, column, content
      errorbells = false; # Disable error bells
      backspace = "indent,eol,start"; # Make backspace behave naturally
      foldmethod = "expr"; # Use expression for folding
      foldexpr = "v:lua.vim.treesitter.foldexpr()"; # Use treesitter for folding
      foldlevel = 99; # Keep all folds open by default
      wildmode = "longest:full,full"; # Completion mode for command-line
      wildignorecase = true; # Case-insensitive tab completion in commands

      # Performance.
      updatetime = 300; # Time to trigger CursorHold in milliseconds
      timeoutlen = 500; # Timeout for mapped sequences in milliseconds

      # Completion.
      # Show menu, auto select first, don't auto pick.
      completeopt = "menu,menuone,noselect";

      # File encoding.
      encoding = "utf-8"; # Set internal encoding to UTF-8
      fileencoding = "utf-8"; # Set default file encoding to UTF-8
    };
  };
}
