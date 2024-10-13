{
  description = "config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Custom flakes
    nixvim.url = "github:flipbagels/nixvim-config";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-darwin,
    nix-homebrew,
    nixvim,
    ...
  } @ inputs: 
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [
        ./nixos/system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.lukas = import ./nixos/home;
            backupFileExtension = "backup";
            extraSpecialArgs = {
              inherit inputs;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
          };
        }
      ];
    };

    darwinConfigurations.Lukass-MacBook-Air = nix-darwin.lib.darwinSystem rec {
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs;
        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [
        ./darwin/system
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.seierl = import ./darwin/home;
            backupFileExtension = "backup";
            extraSpecialArgs = {
              inherit inputs;
              pkgs-unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
              };
            };
          };
        }
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "seierl";
            autoMigrate = true;
          };
        }
      ];
    };
  };
}
