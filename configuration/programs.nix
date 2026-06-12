{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  programs.zsh.enable = true;
  programs.evince.enable = true;
  #programs.throne.enable = true;
  #programs.throne.tunMode.enable = true;

  programs.evolution = {
    enable = true;
    plugins = [ pkgs.evolution-ews ];
  };

  # Add any shared libraries your unpatched binaries require
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];
}
