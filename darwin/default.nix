{ config, pkgs, pkgs-unstable, inputs }:

{
  enviroment.systemPackages =
    [
      pkgs-unstable.neovim
      pkgs.git
      pkgs.gh
    ];

  # Auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = 5;
}
