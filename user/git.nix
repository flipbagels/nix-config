{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Lukas Seier";
    userEmail = "lukas.seier12@gmail.com";
    aliases = {};
  };
}