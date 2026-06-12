{
  config,
  pkgs,
  pkgs-master,
  noctalia,
  ...
}: {
  programs.niri.enable = true;
  #programs.noctalia-shell.enable = true;

  environment.systemPackages = with pkgs; [
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
