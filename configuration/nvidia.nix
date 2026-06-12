{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  # Load the nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelModules = ["nvidia"];

  # Configure the NVIDIA driver
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false; # Use the open-source kernel module
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Use the Bus IDs you found earlier
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:43:0:0";
    };
  };
}
