{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    
    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
  };
}