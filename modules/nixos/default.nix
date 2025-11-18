# ============================================================================
# NixOS Modules.
# ============================================================================
{
  # Shared configurations across multiple NixOS hosts.
  shared-config = import ./shared-config.nix;

  # Laptop specific configurations.
  laptop = import ./graphical/laptop.nix;

  # Desktop specific configurations.
  desktop = import ./graphical/desktop.nix;

  # Filesystem modules.
  btrfs = import ./filesystems/btrfs.nix;

  # Bootloader modules.
  systemd = import ./boot/systemd.nix;

  # Network management modules.
  network-manager = import ./networking/network-manager.nix;

  # Container & virtualization modules.
  podman = import ./virtualization/podman.nix;

  # Game performance optimization modules.
  gamemode = import ./gaming/gamemode.nix;

  # Secret management modules.
  sops = import ./security/sops.nix;

  # SSH.
  ssh = import ./security/ssh.nix;

  # Firewall.
  firewall = import ./security/firewall.nix;

  # Audio handling with PipeWire.
  pipewire = import ./hardware/pipewire.nix;

  # Bluetooth support.
  bluetooth = import ./hardware/bluetooth.nix;

  # Printing support.
  printing = import ./hardware/printing.nix;

  # Display managers.
  sddm = import ./display-managers/sddm.nix;

  # Window managers.
  hyprland = import ./wm/hyprland;

  # Shells.
  fish = import ./shells/fish.nix;
}
