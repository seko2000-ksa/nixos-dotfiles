{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    colorScheme = "dark";
    gtk3.colorScheme = "dark";
    gtk4.colorScheme = "dark";

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    #    gtk3.extraConfig = {
    #     "gtk-application-prefer-dark-theme" = 1;
    #   };

    #    gtk4.extraConfig = {
    #      "gtk-application-prefer-dark-theme" = 1;
    #    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "Fusion";
  };

  home.pointerCursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
    ICON_THEME = "Papirus";
    QS_ICON_THEME = "Papirus";
  };
}
