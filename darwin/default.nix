{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  environment.systemPackages =
    ( with pkgs; [
      git
      gh
    ])
    ++ ( with pkgs-unstable; [
      neovim
    ])
    ++ [
      inputs.nixvim.packages.aarch64-darwin.default
    ];

  # Auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  users.users.seierl.home = "/Users/seierl";

  system.stateVersion = 5;
}
