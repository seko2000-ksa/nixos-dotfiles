{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.git;
    userName = "seko2000-ksa";
    userEmail = "seko2000@gmail.com";
    settings = {
      core.editor = "nvim";
    };
  };
}
