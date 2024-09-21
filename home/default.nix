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
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    deskreen
    discord
    gh
    gimp
    # libreoffice
    # okular
    openconnect
    ripgrep
    slack
    spotify
    teams-for-linux
    # wineWowPackages.waylandFull
    zoom-us
    zotero_7
  ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}