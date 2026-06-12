# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').
{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./xkb.nix
    ./services.nix
    ./nvidia.nix
    ./env.nix
    ./fonts.nix
    ./programs.nix
    ./niri.nix
    ./update.nix
    ./bluetooth.nix
    ./virtualization.nix
    ./bootloader.nix
    ./gnupg.nix
    #./gaming.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      #networkmanager-fortisslvpn
      #networkmanager-iodine
      #networkmanager-l2tp
      #networkmanager-openconnect
      networkmanager-openvpn
      #networkmanager-sstp
      #networkmanager-strongswan
      networkmanager-vpnc
    ];
  };

  security.rtkit.enable = true;

  users.users.ksa = {
    isNormalUser = true;
    description = "ksa";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.trusted-users = ["root" "ksa"];
}
