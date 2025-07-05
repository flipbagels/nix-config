{ config, pkgs, system, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = import ./aliases { inherit system; };
    initExtra = builtins.readFile ./initExtra.sh;
  };
}
