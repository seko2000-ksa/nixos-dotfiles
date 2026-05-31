{ config, pkgs, pkgs-master, ... }:

{
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
}
