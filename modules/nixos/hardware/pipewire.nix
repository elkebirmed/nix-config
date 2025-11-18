# ============================================================================
# PipeWire audio & video service.
# - https://wiki.nixos.org/wiki/PipeWire
# - https://www.pipewire.org/
# ============================================================================
{lib, ...}: {
  # Hands out realtime scheduling priority to user processes on demand.
  security.rtkit.enable = lib.mkDefault true;

  # Disable PulseAudio service to avoid conflicts with PipeWire.
  services.pulseaudio.enable = lib.mkDefault false;

  services.pipewire = {
    # Enable PipeWire service and its components.
    enable = lib.mkDefault true;

    # Enable ALSA support for PipeWire.
    alsa.enable = lib.mkDefault true;

    # Support for 32-bit ALSA applications.
    alsa.support32Bit = lib.mkDefault true;

    # Enable PulseAudio compatibility layer for PipeWire.
    pulse.enable = lib.mkDefault true;

    # Enable JACK support for PipeWire.
    jack.enable = lib.mkDefault true;
  };
}
