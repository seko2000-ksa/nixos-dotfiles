{ config, pkgs, pkgs-master, ... }:

{
  # Bootloader.
  boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ "nvidia" ];
      plymouth.enable = true;
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [ "quiet" "splash" ];
  };
}
