{ config, pkgs, pkgs-master, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    shellAliases = {
      ls = "eza";
      lz = "lazygit";
      yz = "yazi";
      nrt = "sudo nixos-rebuild test --flake .";
      nrs = "sudo nixos-rebuild switch --flake .";
    };

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      package = pkgs.oh-my-zsh;
      #custom = "$HOME/.oh-my-custom";
      theme = "agnoster";
      plugins = [ "git" "z" "docker" "docker-compose" "eza" "fzf" ];
    };
  };

}
