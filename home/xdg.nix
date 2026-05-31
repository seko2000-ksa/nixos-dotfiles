{ config, pkgs, pkgs-master, ... }:

{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";
  
  xdg.configFile = {
    #"starship.toml".source = ../config/starship/starship.main.toml;
    #"alacritty/alacritty.toml".source = ../config/alacritty/alacritty.toml;
    #"eza/theme.yml".source = ../config/eza/eza.main.yml;
    #"fuzzel/fuzzel.ini".source = ../config/fuzzel/tokyonight.fuzzel.ini;
    "fastfetch/config.jsonc".source = ../config/fastfetch/main.fastfetch;
    #"fastfetch/violet.png".source = ../config/icons/violet.png;
    "qt5ct/qt5ct.conf".source = ../config/qt5ct/qt5ct.conf;
    "qt5ct/colors/noctalia.conf".source = ../config/qt5ct/colors/noctalia.conf;
    #"nvim/".source = ../config/nvim;
    "gtk-3.0/settings.ini".force = true;
    "gtk-4.0/settings.ini".force = true;
    #"gtk-4.0/gtk.css".force = true;
    "niri/config.kdl".source = ../config/niri/config.kdl;
    "niri/noctalia.kdl".source = ../config/niri/noctalia.kdl;
    #"ghostty/config".source = ../config/ghostty/tokyo-night.ghostty;
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "image/*" = ["imv"];
    };

    defaultApplications = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "image/*" = ["imv"];
    };
  };

}