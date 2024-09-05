{
  description = "config flake";

  inputs = {
    # Nix packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nurpkgs.url = "github:nix-community/NUR";
    # swww = {
    #   url = "github:LGFae/swww";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # openconnect-sso = {
    #   url = "github:vlaci/openconnect-sso";
    #   input.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, ...  }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs.flake-inputs = inputs;
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.lukas = import ./home;
          home-manager.backupFileExtension = "hm-backup";
          home-manager.extraSpecialArgs.flake-inputs = inputs;
        }
      ];
    };
  };
}
