{ config, pkgs, pkgs-master, ... }:

{
    programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      xwayland-satellite
      tokyonight-gtk-theme
      swayimg
      rose-pine-cursor
      papirus-icon-theme
      fuzzel
      gpu-screen-recorder
      wl-clipboard
      libsForQt5.qt5ct
      mpvpaper
    ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
          user = "greeter";
        };

        initial_session = {
          command = "niri-session";
          user = "ksa";
        };
      };
    };
}
