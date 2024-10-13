
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = import ./aliases;
  };
}
