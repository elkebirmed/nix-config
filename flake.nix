# ============================================================================
# My NixOS Configuration Flake.
# - https://wiki.nixos.org/wiki/Flakes
# ============================================================================
{
  description = "My NixOS Config";

  inputs = {
    # Use the latest NixOS unstable as the base.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Default set of systems for nix flakes.
    # https://github.com/nix-systems/default-linux
    systems.url = "github:nix-systems/default-linux";

    # Managing disks and partitions.
    # https://github.com/nix-community/disko
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Managing user configurations.
    # https://github.com/nix-community/home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim editor configuration.
    # https://github.com/nix-community/nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Base16 color schemes.
    # https://github.com/misterio77/nix-colors
    nix-colors.url = "github:misterio77/nix-colors";

    # SOPS secrets.
    # https://github.com/mic92/sops-nix
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Firefox add-ons.
    # https://gitlab.com/rycee/nur-expressions
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Gaming.
    # https://github.com/fufexan/nix-gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # Merge libraries from nixpkgs and home-manager.
    lib = nixpkgs.lib // home-manager.lib;

    # Generate package sets for each system.
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    inherit lib;

    # Modules for NixOS and Home Manager.
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # Formatter.
    formatter = forEachSystem (pkgs: pkgs.alejandra);

    # NixOS configurations.
    nixosConfigurations = {
      # Personal laptop.
      crazy = lib.nixosSystem {
        modules = [./hosts/crazy];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };
  };
}
