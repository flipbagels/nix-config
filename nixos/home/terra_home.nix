{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ../../modules/shell/bash.nix
  ];

  home.packages =
    (with pkgs; [
    ])
    ++ (with pkgs-unstable; [
    ]);

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
