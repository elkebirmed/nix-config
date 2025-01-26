{ pkgs, inputs, outputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  inputs.home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs outputs;};
    programs.home-manager.enable = true;

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";
  };
}
