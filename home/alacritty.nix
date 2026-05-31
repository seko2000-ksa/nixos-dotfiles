{ config, pkgs, pkgs-master, ... }:

{
programs.alacritty = {
  enable = true;
  settings = {
    window = {
      opacity = 0.9;
      decorations = "None";
    };
    font = {
      normal = {
        family = "JetBrainsMono Nerd Font";
        style = "Regular";
      };
      size = 12.0;
    };
  };
};
}
