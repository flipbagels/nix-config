{
  description = "config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-vscode-extensions = {
    #   url = "github:nix-community/nix-vscode-extensions";
    #   inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };

    mac-app-util.url = "github:hraban/mac-app-util";

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
    mac-app-util,
    nixvim,
    ...
  } @ inputs: 
  {
    nixosConfigurations = builtins.mapAttrs (
      name: host:
      nixpkgs.lib.nixosSystem rec {
        system = host.system;
        specialArgs = {
          inherit inputs;
          inherit system;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./hosts/${name}.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.lukas = import ./nixos/home/${name}_home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit inputs;
                inherit system;
                pkgs-unstable = import nixpkgs-unstable {
                  inherit system;
                  config.allowUnfree = true;
                };
              };
            };
          }
        ];
      }
    ) {
      terra = { system = "x86_64-linux"; };
      aqua = { system = "x86_64-linux"; };
    };

    darwinConfigurations = builtins.mapAttrs (
      name: host:
      nix-darwin.lib.darwinSystem rec {
        system = host.system;
        specialArgs = {
          inherit inputs;
          inherit system;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit mac-app-util;
        };
        modules = [
          ./hosts/${name}.nix
          mac-app-util.darwinModules.default
          home-manager.darwinModules.default
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
      }
    ) {
      ventus = { system = "aarch64-darwin"; };
    };
  };
}
