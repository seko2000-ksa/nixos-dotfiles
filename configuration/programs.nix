{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  programs.zsh.enable = true;
  programs.evince.enable = true;
  programs.chromium.enable = true;
  programs.evolution = {
    enable = true;
    plugins = ["evolution-ews"];
  };

  # Add any shared libraries your unpatched binaries require
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];
}
