{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = ["quiet" "splash"];
  };

  hardware.cpu.amd.updateMicrocode = true;

  hardware.enableAllFirmware = true;
}
