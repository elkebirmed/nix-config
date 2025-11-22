# ============================================================================
# Neovim keymaps.
# - https://nix-community.github.io/nixvim/
# ============================================================================
{
  ...
}: {
  programs.nixvim = {
    # Global options.
    globals = {
      mapleader = " "; # Set the global leader key to space
      maplocalleader = " "; # Set the local leader key to space
    };

    keymaps = [
      # General.

      # Save file.
      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
        options = {desc = "Save file";};
      }

      # Quit.
      {
        mode = "n";
        key = "<leader>qq";
        action = ":q<CR>";
        options = {desc = "Quit";};
      }

      # Quit all without saving.
      {
        mode = "n";
        key = "<leader>Q";
        action = ":qa!<CR>";
        options = {desc = "Quit all without saving";};
      }

      # Clear search highlights.
      {
        mode = "n";
        key = "<Esc>";
        action = ":noh<CR>";
        options = {
          desc = "Clear search highlights";
          silent = true;
        };
      }

      # Window navigation.
      {
        mode = "n";
        key = "<C-Up>";
        action = "<C-w>k";
        options = {desc = "Go to upper window";};
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<C-w>j";
        options = {desc = "Go to lower window";};
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<C-w>h";
        options = {desc = "Go to left window";};
      }
      {
        mode = "n";
        key = "<C-Right>";
        action = "<C-w>l";
        options = {desc = "Go to right window";};
      }

      # Window resizing.
      {
        mode = "n";
        key = "<A-Up>";
        action = ":resize +2<CR>";
        options = {desc = "Increase window height";};
      }
      {
        mode = "n";
        key = "<A-Down>";
        action = ":resize -2<CR>";
        options = {desc = "Decrease window height";};
      }
      {
        mode = "n";
        key = "<A-Left>";
        action = ":vertical resize -2<CR>";
        options = {desc = "Decrease window width";};
      }
      {
        mode = "n";
        key = "<A-Right>";
        action = ":vertical resize +2<CR>";
        options = {desc = "Increase window width";};
      }

      # Buffer navigation.
      {
        mode = "n";
        key = "<S-Right>";
        action = ":bnext<CR>";
        options = {desc = "Next buffer";};
      }
      {
        mode = "n";
        key = "<S-Left>";
        action = ":bprevious<CR>";
        options = {desc = "Previous buffer";};
      }
      {
        mode = "n";
        key = "<leader>xx";
        action = ":bdelete<CR>";
        options = {desc = "Close buffer";};
      }

      # Move lines up/down.
      {
        mode = "n";
        key = "<S-Down>";
        action = ":m .+1<CR>==";
        options = {desc = "Move line down";};
      }
      {
        mode = "n";
        key = "<S-Up>";
        action = ":m .-2<CR>==";
        options = {desc = "Move line up";};
      }
      {
        mode = "v";
        key = "<S-Down>";
        action = ":m '>+1<CR>gv=gv";
        options = {desc = "Move selection down";};
      }
      {
        mode = "v";
        key = "<S-Up>";
        action = ":m '<-2<CR>gv=gv";
        options = {desc = "Move selection up";};
      }

      # Stay in visual mode when indenting.
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {desc = "Decrease indent";};
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {desc = "Increase indent";};
      }

      # Better paste.
      {
        mode = [ "n" "x" ];
        key = "<leader>fp";
        action = "<cmd>YankyRingHistory<cr>";
        options = { desc = "Open Yank History"; };
      }
      {
        mode = [ "n" "x" ];
        key = "y";
        action = "<Plug>(YankyYank)";
        options = { desc = "Yank text"; };
      }
      {
        mode = [ "n" "x" ];
        key = "p";
        action = "<Plug>(YankyPutAfter)";
        options = { desc = "Put yanked text after cursor"; };
      }
      {
        mode = [ "n" "x" ];
        key = "P";
        action = "<Plug>(YankyPutBefore)";
        options = { desc = "Put yanked text before cursor"; };
      }
      {
        mode = [ "n" "x" ];
        key = "]p";
        action = "<Plug>(YankyPutIndentAfterLinewise)";
        options = { desc = "Put indented after cursor (linewise)"; };
      }
      {
        mode = [ "n" "x" ];
        key = "[p";
        action = "<Plug>(YankyPutIndentBeforeLinewise)";
        options = { desc = "Put indented before cursor (linewise)"; };
      }
      {
        mode = [ "n" "x" ];
        key = "]P";
        action = "<Plug>(YankyPutIndentAfterLinewise)";
        options = { desc = "Put indented after cursor (linewise)"; };
      }
      {
        mode = [ "n" "x" ];
        key = "[P";
        action = "<Plug>(YankyPutIndentBeforeLinewise)";
        options = { desc = "Put indented before cursor (linewise)"; };
      }
      {
        mode = [ "n" "x" ];
        key = ">p";
        action = "<Plug>(YankyPutIndentAfterShiftRight)";
        options = { desc = "Put and indent right"; };
      }
      {
        mode = [ "n" "x" ];
        key = "<p";
        action = "<Plug>(YankyPutIndentAfterShiftLeft)";
        options = { desc = "Put and indent left"; };
      }
      {
        mode = [ "n" "x" ];
        key = ">P";
        action = "<Plug>(YankyPutIndentBeforeShiftRight)";
        options = { desc = "Put before and indent right"; };
      }
      {
        mode = [ "n" "x" ];
        key = "<P";
        action = "<Plug>(YankyPutIndentBeforeShiftLeft)";
        options = { desc = "Put before and indent left"; };
      }
      {
        mode = [ "n" "x" ];
        key = "=p";
        action = "<Plug>(YankyPutAfterFilter)";
        options = { desc = "Put after applying a filter"; };
      }
      {
        mode = [ "n" "x" ];
        key = "=P";
        action = "<Plug>(YankyPutBeforeFilter)";
        options = { desc = "Put before applying a filter"; };
      }

      # Keep cursor centered when scrolling.
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {desc = "Scroll up and center";};
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {desc = "Scroll down and center";};
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
        options = {desc = "Next search result centered";};
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
        options = {desc = "Previous search result centered";};
      }

      # Split windows.
      {
        mode = "n";
        key = "<leader>hs";
        action = ":split<CR>";
        options = {desc = "Split window horizontally";};
      }
      {
        mode = "n";
        key = "<leader>vs";
        action = ":vsplit<CR>";
        options = {desc = "Split window vertically";};
      }

      # File explorer.
      {
        mode = "n";
        key = "<leader>ee";
        action = ":NvimTreeToggle<CR>";
        options = {desc = "Toggle file explorer";};
      }

      # Top Pickers & Explorer
      {
        mode = "n";
        key = "<leader><space>";
        action = ":lua Snacks.picker.smart()<CR>";
        options = {desc = "Smart Find Files";};
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = ":lua Snacks.picker.files()<CR>";
        options = {desc = "Find Files";};
      }
      {
        mode = "n";
        key = "<leader>,";
        action = ":lua Snacks.picker.buffers()<CR>";
        options = {desc = "Buffers";};
      }
      {
        mode = "n";
        key = "<leader>/";
        action = ":lua Snacks.picker.grep()<CR>";
        options = {desc = "Grep";};
      }
      {
        mode = "n";
        key = "<leader>fn";
        action = ":lua Snacks.picker.notifications()<CR>";
        options = {desc = "Notification History";};
      }
      {
        mode = "n";
        key = "<leader>fe";
        action = ":lua Snacks.explorer()<CR>";
        options = {desc = "File Explorer";};
      }
      {
        mode = "n";
        key = "<leader>fp";
        action = ":lua Snacks.picker.projects()<CR>";
        options = {desc = "Projects";};
      }
      {
        mode = "n";
        key = "<leader>s\"";
        action = ":lua Snacks.picker.registers()<CR>";
        options = {desc = "Registers";};
      }
      {
        mode = "n";
        key = "<leader>sc";
        action = ":lua Snacks.picker.commands()<CR>";
        options = {desc = "Commands";};
      }
      {
        mode = "n";
        key = "<leader>sd";
        action = ":lua Snacks.picker.diagnostics()<CR>";
        options = {desc = "Diagnostics";};
      }
      {
        mode = "n";
        key = "<leader>sD";
        action = ":lua Snacks.picker.diagnostics_buffer()<CR>";
        options = {desc = "Buffer Diagnostics";};
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = ":lua Snacks.picker.help()<CR>";
        options = {desc = "Help Pages";};
      }
      {
        mode = "n";
        key = "<leader>sj";
        action = ":lua Snacks.picker.jumps()<CR>";
        options = {desc = "Jumps";};
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = ":lua Snacks.picker.keymaps()<CR>";
        options = {desc = "Keymaps";};
      }
      {
        mode = "n";
        key = "<leader>sm";
        action = ":lua Snacks.picker.marks()<CR>";
        options = {desc = "Marks";};
      }
      {
        mode = "n";
        key = "<leader>sM";
        action = ":lua Snacks.picker.man()<CR>";
        options = {desc = "Man Pages";};
      }
      {
        mode = "n";
        key = "<leader>sq";
        action = ":lua Snacks.picker.qflist()<CR>";
        options = {desc = "Quickfix List";};
      }
      {
        mode = "n";
        key = "<leader>su";
        action = ":lua Snacks.picker.undo()<CR>";
        options = {desc = "Undo History";};
      }

      # LSP.
      {
        mode = "n";
        key = "gd";
        action = ":lua Snacks.picker.lsp_definitions()<CR>";
        options = {desc = "Go to definition";};
      }
      {
        mode = "n";
        key = "gD";
        action = ":lua Snacks.picker.lsp_declarations()<CR>";
        options = {desc = "Go to declaration";};
      }
      {
        mode = "n";
        key = "gI";
        action = ":lua Snacks.picker.lsp_implementations()<CR>";
        options = {desc = "Go to implementation";};
      }
      {
        mode = "n";
        key = "gr";
        action = ":lua Snacks.picker.lsp_references()<CR>";
        options = {desc = "Find references";};
      }
      {
        mode = "n";
        key = "gy";
        action = ":lua Snacks.picker.lsp_type_definitions()<CR>";
        options = {desc = "Go to type definition";};
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = ":lua Snacks.picker.lsp_symbols()<CR>";
        options = {desc = "Go to symbols";};
      }
      {
        mode = "n";
        key = "<leader>fS";
        action = ":lua Snacks.picker.lsp_workspace_symbols()<CR>";
        options = {desc = "Go to workspace symbols";};
      }
      {
        mode = "n";
        key = "K";
        action = ":lua vim.lsp.buf.hover()<CR>";
        options = {desc = "Hover documentation";};
      }
      {
        mode = "n";
        key = "<leader>rn";
        action = ":lua vim.lsp.buf.rename()<CR>";
        options = {desc = "Rename symbol";};
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = ":lua vim.lsp.buf.code_action()<CR>";
        options = {desc = "Code action";};
      }
      {
        mode = "n";
        key = "<leader>bf";
        action = ":lua vim.lsp.buf.format({ async = true })<CR>";
        options = {desc = "Format buffer";};
      }
      {
        mode = "n";
        key = "<leader>dd";
        action = ":lua vim.diagnostic.open_float()<CR>";
        options = {desc = "Show diagnostics";};
      }
      {
        mode = "n";
        key = "[d";
        action = ":lua vim.diagnostic.goto_prev()<CR>";
        options = {desc = "Previous diagnostic";};
      }
      {
        mode = "n";
        key = "]d";
        action = ":lua vim.diagnostic.goto_next()<CR>";
        options = {desc = "Next diagnostic";};
      }

      # Git.
      {
        mode = "n";
        key = "<leader>gg";
        action = ":LazyGit<CR>";
        options = {desc = "LazyGit";};
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = ":Gitsigns blame_line<CR>";
        options = {desc = "Git blame line";};
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = ":Gitsigns preview_hunk<CR>";
        options = {desc = "Preview hunk";};
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = ":Gitsigns reset_hunk<CR>";
        options = {desc = "Reset hunk";};
      }

      # Terminal.
      {
        mode = "n";
        key = "<leader>tt";
        action = ":ToggleTerm<CR>";
        options = {desc = "Toggle terminal";};
      }
    ];
  };
}
