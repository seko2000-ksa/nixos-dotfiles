{
  config,
  pkgs,
  inputs,
  pkgs-master,
  ...
}: {
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  imports = [
    ./git.nix
    ./zsh.nix
    #./lazyvim.nix
    #./neovim.nix
    ./xdg.nix
    ./zsh.nix
    ./btop.nix
    ./gtk.nix
    ./alacritty.nix
    ./eza.nix
    ./nh.nix
  ];

  home.packages = with pkgs; [
    noctalia-shell
    chromium
    #act
    #actionlint
    alacritty
    #asciinema
    #asciinema-agg
    #ashell
    #autojump
    bat
    blueman
    #brightnessctl
    htop
    bun
    #cliphist
    curl
    #dig
    direnv
    #discord
    #distrobox
    devenv
    #dufs
    evince
    eza
    far2l
    fastfetch
    fd
    ffmpeg
    ffmpegthumbnailer
    #file
    #file-roller
    foot
    fzf
    gcc
    gifsicle
    git
    #glow
    #grim
    gtrash
    hyprpaper
    imagemagick
    imv
    inotify-tools
    jq
    lazygit
    ledger
    lsd
    lsof
    maestral
    maestral-gui
    miniserve
    nix-direnv
    nixfmt
    #nodejs_24
    obsidian
    openssh
    openssl
    papirus-icon-theme
    #parallel
    parted
    pciutils
    pkg-config
    playerctl
    poppler
    pup
    #qmk
    qrencode
    rclone
    ristretto
    satty
    #screen
    #slurp
    smartmontools
    #statix
    #stow
    superfile
    #sxiv
    #tealdeer
    telegram-desktop
    #terraform
    typst
    unrar
    unzip
    usbutils
    waybar
    wev
    wget
    whois
    wl-clipboard
    #yad
    zip
    zoxide
    secretspec
    tree-sitter
    neovim
    nixd
    alejandra
    luaPackages.jsregexp
    tmux
    gnupg
    pass
    passExtensions.pass-update
    pinentry-curses
    rustup
  ];

  programs.mpv = {
    enable = true;
    scripts = [pkgs.mpvScripts.mpris];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
