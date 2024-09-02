{ config, pkgs,  ... }:

{
  imports = [
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    deskreen
    discord
    gh
    libreoffice
    #okular # pdf viewer
    slack
    spotify
    zoom-us
    zotero_7
  ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}