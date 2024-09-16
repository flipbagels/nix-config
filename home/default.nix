{ config, pkgs, flake-inputs, ... }:

{
  imports = [
    ./bash.nix
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    # ./gtk.nix
    ./python.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    deskreen
    discord
    gh
    libreoffice
    # okular # pdf viewer
    openconnect
    slack
    spotify
    teams-for-linux
    wineWowPackages.waylandFull
    zoom-us
    zotero_7
  ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}