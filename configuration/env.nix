{ config, pkgs, pkgs-master, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    v4l-utils
    udiskie
    dnsmasq
    udev
    #pkgs.nur.repos.dcsunset.ogatak
    #pkgs.nur.repos.foolnotion.q5go
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" "/share/zsh" ];
}
