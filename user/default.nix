{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./gnome.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    discord
    gh
    #okular # pdf viewer
    spotify
  ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}