{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  inputs,
  system,
  mac-app-util,
  ...
}:

let
  cfg = config.modules.home-manager;
in
{
  options.modules.home-manager.enable = lib.mkEnableOption "home manager";

  config = lib.mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.seierl = import ./home;
      sharedModules = [
        mac-app-util.homeManagerModules.default
      ];
      backupFileExtension = "backup";
      extraSpecialArgs = {
        inherit inputs;
        inherit system;
        inherit pkgs-unstable;
      };
    };
  };
}
