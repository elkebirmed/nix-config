# ============================================================================
# Fish shell.
# - https://fishshell.com/
# ============================================================================
{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./tide.nix
    ./bindings.nix
  ];

  # Packages to be installed for fish shell.
  home.packages = [pkgs.bash-completion];

  programs.fish = {
    enable = lib.mkDefault true;

    # Abbreviations are like aliases but expand inline.
    shellAbbrs = rec {
      n = "nix";
      nd = "nix develop -c $SHELL";
      ns = "nix shell";
      nsn = "nix shell nixpkgs#";
      nb = "nix build";
      nbn = "nix build nixpkgs#";
      nf = "nix flake";

      nr = "nixos-rebuild --flake .";
      nrs = "nixos-rebuild --flake . switch";
      snr = "sudo nixos-rebuild --flake .";
      snrs = "sudo nixos-rebuild --flake . switch";
      hm = "home-manager --flake .";
      hms = "home-manager --flake . switch";
    };

    # Fish functions.
    functions = {
      # Disable greeting.
      fish_greeting = "";

      # Merge history when pressing up.
      up-or-search = lib.readFile ./up-or-search.fish;

      # Check stuff in PATH.
      nix-inspect =
        /*
        fish
        */
        ''
          set -s PATH |
            grep "PATH\[.*/nix/store" |
            cut -d '|' -f2 |
            grep -v -e "-man" -e "-terminfo" |
            perl -pe 's:^/nix/store/\w{32}-([^/]*)/bin$:\1:' |
            sort |
            uniq
        '';

      # Bash completion support.
      __fish_complete_bash =
        /*
        fish
        */
        ''
          set cmd (commandline -cp)
          bash -ic "source ${./get-bash-completions.sh}; get_completions '$cmd'"
        '';
    };
  };
}
