{ config, pkgs, ... }:

{
  home.file.".config/aerospace/aerospace.toml".text = builtins.readFile ./aerospace.toml;
}
