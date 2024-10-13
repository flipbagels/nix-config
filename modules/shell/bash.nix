{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = import ./aliases;
  };
}
