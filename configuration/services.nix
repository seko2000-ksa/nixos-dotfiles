{ config, pkgs, pkgs-master, ... }:

{
    # Load the nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

   services = {
      hardware.openrgb.enable = true;
      flatpak.enable = true;
      udisks2.enable = true;
      printing.enable = true;
    };
}