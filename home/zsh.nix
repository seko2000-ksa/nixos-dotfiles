{
  config,
  pkgs,
  pkgs-master,
  ...
}: {
  programs.zsh = {
    enable = true;
  initContent = ''
    export PATH="/home/ksa/.cargo/bin:$PATH"
    export TODO_DIR="/home/ksa/Documents/todo"
    export TODO_FILE="/home/ksa/Documents/todo/todo.txt"
    export DONE_FILE="/home/ksa/Documents/todo/done.txt"
  '';
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    shellAliases = {
      lz = "lazygit";
      nrt = "sudo nixos-rebuild test --flake ~/nixos-dotfiles#acer";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#acer";
      nrtu = "sudo nixos-rebuild test --flake ~/nixos-dotfiles#acer --upgrade";
      nrsu = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#acer --upgrade";
    };

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      package = pkgs.oh-my-zsh;
      custom = "/home/ksa/.oh-my-custom";
      theme = "lcars";
      plugins = ["git" "z" "eza" "fzf" "pass"];
    };
  };
}
