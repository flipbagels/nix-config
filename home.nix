{ config, pkgs, ... }:

{
  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.packages = with pkgs; [
    discord
    gh
    #okular # pdf viewer
    spotify
    vscode
  ];

  programs.git = {
    enable = true;
    userName = "Lukas Seier";
    userEmail = "lukas.seier12@gmail.com";
    aliases = {};
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      speed = 0.0;
      natural-scroll = false;
    };
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}