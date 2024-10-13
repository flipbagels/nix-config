{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    karabiner-elements
  ];

  xdg.configFile = {
    "karabiner/karabiner.json".source = ./karabiner.json;
  };
}
