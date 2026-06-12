{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
}