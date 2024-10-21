{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = import ./aliases;
    initExtra = builtins.readFile ./initExtra.sh;
  };
}
