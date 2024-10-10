{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  environment.systemPackages =
    [
      pkgs-unstable.neovim
      pkgs.git
      pkgs.gh
    ];

  # Auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  system.stateVersion = 5;
}
