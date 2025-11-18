# ============================================================================
# Lazygit.
# - https://github.com/jesseduffield/lazygit
# ============================================================================
{ config, lib, pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    
    settings = {
      gui = {
        # Theme
        theme = {
          activeBorderColor = [ "#89b4fa" "bold" ];
          inactiveBorderColor = [ "#45475a" ];
          optionsTextColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#313244" ];
          selectedRangeBgColor = [ "#313244" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          cherryPickedCommitFgColor = [ "#89b4fa" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
          searchingActiveBorderColor = [ "#f9e2af" ];
        };
        
        # UI preferences
        showListFooter = true;
        showFileTree = true;
        showRandomTip = false;
        showCommandLog = false;
        nerdFontsVersion = "3";
        commitLength.show = true;
        
        # Icons
        showIcons = true;
        
        # Mouse support
        mouseEvents = true;
      };
      
      git = {
        pagers = [
          {
            pager = "delta --dark --paging=never";
            colorArg = "always";
          }
        ];
        
        # Commit settings
        commit = {
          signOff = false;
          autoWrapCommitMessage = true;
          autoWrapWidth = 72;
        };
        
        # Merging
        merging = {
          manualCommit = false;
          args = "";
        };
        
        # Pull
        pull = {
          mode = "merge";
        };
        
        # Log
        log = {
          order = "topo-order";
          showGraph = "always";
          showWholeGraph = false;
        };
        
        # Diff context lines
        diffContextSize = 3;
        
        # Skip hooks
        skipHookPrefix = "WIP";
        
        # Auto fetch
        autoFetch = true;
        autoRefresh = true;
        fetchAll = true;
        
        # Branch settings
        branchLogCmd = "git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}} --";
        allBranchesLogCmds = [
          "git log --graph --all --color=always --abbrev-commit --decorate --date=relative --pretty=medium"
        ];
        
        # Override git commands
        overrideGpg = false;
        disableForcePushing = false;
      };
      
      # Refresher
      refresher = {
        refreshInterval = 10;
        fetchInterval = 60;
      };
      
      # Update
      update = {
        method = "never";
      };
      
      # Confirmation
      confirmOnQuit = false;
      quitOnTopLevelReturn = false;
      
      # Keybindings
      keybinding = {
        universal = {
          quit = "q";
          quit-alt1 = "<c-c>";
          return = "<esc>";
          quitWithoutChangingDirectory = "Q";
          togglePanel = "<tab>";
          prevItem = "<up>";
          nextItem = "<down>";
          prevItem-alt = "k";
          nextItem-alt = "j";
          prevPage = ",";
          nextPage = ".";
          scrollLeft = "H";
          scrollRight = "L";
          gotoTop = "<";
          gotoBottom = ">";
          toggleRangeSelect = "v";
          rangeSelectDown = "<s-down>";
          rangeSelectUp = "<s-up>";
          prevBlock = "<left>";
          nextBlock = "<right>";
          prevBlock-alt = "h";
          nextBlock-alt = "l";
          nextMatch = "n";
          prevMatch = "N";
          startSearch = "/";
          optionMenu = "x";
          optionMenu-alt1 = "?";
          select = "<space>";
          goInto = "<enter>";
          confirm = "<enter>";
          remove = "d";
          new = "n";
          edit = "e";
          openFile = "o";
          scrollUpMain = "<pgup>";
          scrollDownMain = "<pgdown>";
          scrollUpMain-alt1 = "K";
          scrollDownMain-alt1 = "J";
          scrollUpMain-alt2 = "<c-u>";
          scrollDownMain-alt2 = "<c-d>";
          executeShellCommand = ":";
          createRebaseOptionsMenu = "m";
          pushFiles = "P";
          pullFiles = "p";
          refresh = "R";
          createPatchOptionsMenu = "<c-p>";
          nextTab = "]";
          prevTab = "[";
          nextScreenMode = "+";
          prevScreenMode = "_";
          undo = "z";
          redo = "<c-z>";
          filteringMenu = "<c-s>";
          diffingMenu = "W";
          diffingMenu-alt = "<c-e>";
          copyToClipboard = "<c-o>";
          openRecentRepos = "<c-r>";
          submitEditorText = "<enter>";
          extrasMenu = "@";
          toggleWhitespaceInDiffView = "<c-w>";
          increaseContextInDiffView = "}";
          decreaseContextInDiffView = "{";
        };
      };
      
      # OS
      os = {
        editPreset = "nvim";
        edit = "nvim {{filename}}";
        editAtLine = "nvim +{{line}} {{filename}}";
        editAtLineAndWait = "nvim +{{line}} {{filename}}";
        open = "xdg-open {{filename}} >/dev/null";
        openLink = "xdg-open {{link}} >/dev/null";
      };
      
      # Custom commands
      customCommands = [
        {
          key = "<c-a>";
          command = "git commit --amend --no-edit";
          context = "files";
          description = "Amend last commit without editing message";
          output = "log";
        }
        {
          key = "<c-r>";
          command = "git reset --soft HEAD~1";
          context = "commits";
          description = "Undo last commit (keep changes)";
        }
      ];
    };
  };
}
