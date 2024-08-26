{ config, pkgs, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.packages = with pkgs; [
    gh
    vscode
    spotify
    discord
  ];

  programs.git = {
    enable = true;
    userName = "Lukas Seier";
    userEmail = "lukas.seier12@gmail.com";
    aliases = {};
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}