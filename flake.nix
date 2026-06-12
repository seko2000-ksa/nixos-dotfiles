{
  description = "NixOS and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs?ref=master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";
    lazyvim.inputs.nixpkgs.follows = "nixpkgs";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-master,
    home-manager,
    noctalia,
    lazyvim,
    nur,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      config.android_sdk.accept_license = true;
      overlays = [];
    };
    pkgs-master = import nixpkgs-master {
      inherit system;
      config.allowUnfree = true;
    };

    # Shared Home Manager modules for both NixOS and standalone configurations
    homeModules = [
      ./home
      lazyvim.homeManagerModules.default
      noctalia.homeModules.default
    ];
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations.acer = nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      specialArgs = {inherit pkgs-master;};
      modules = [
        ./configuration
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit pkgs-master;};
            users.ksa = {
              config,
              pkgs,
              lazyvim,
              ...
            }: {imports = homeModules;};
            backupFileExtension = "backup";
          };
        }
      ];
    };

    homeConfigurations.ksa = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules =
        homeModules
        ++ [
          {
            home.username = "ksa";
            home.homeDirectory = "/home/ksa";
          }
        ];
      extraSpecialArgs = {inherit pkgs-master;};
    };
  };
}
