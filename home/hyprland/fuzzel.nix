{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Jetbrains Mono:size=10";
      };
      key-bindings = {
        cancel =  "Escape Control+bracketleft";
      };
    };
  };
}
