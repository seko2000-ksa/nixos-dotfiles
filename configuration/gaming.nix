{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs = {
    gamemode.enable = true;
    gamescope.enable = true;
    steam = {
      # package = pkgs.steam.override {
      #   extraProfile = ''
      #     unset TZ
      #     # Allows Monado/WiVRn to be used
      #     export PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1
      #   '';
      # };
      enable = true;
      # extraCompatPackages = with pkgs; [
      #   proton-ge-bin
      # ];
      # extraPackages = with pkgs; [
      #   SDL2
      #   gamescope
      #   er-patcher
      # ];
      protontricks.enable = true;
    };
  };

specialisation = {
    gaming-time.configuration = {

      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };

    };
  };
  environment.systemPackages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.wine-tkg
    lutris
    steam-run
    dxvk
    gamescope
    mangohud
    r2modman
    heroic
    er-patcher
    bottles
    steamtinkerlaunch
    prismlauncher
    lsfg-vk
    lsfg-vk-ui
    self.packages.${pkgs.system}.wow-launcher
    winetricks
    vulkan-loader
  ];

  services.zerotierone.enable = true;
}
