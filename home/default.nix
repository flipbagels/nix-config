{ config, pkgs, inputs, ... }:

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

  home.packages = (with pkgs; [
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
  ]) ++ [
    inputs.nixvim.packages.x86_64-linux.default
  ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}