
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = import ./aliases;
    # initExtra = builtins.readFile ./initExtra.sh;

    # Enable zplug and install plugins
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ "as:theme" "depth:1" ]; }
      ];
    };

    initContent = builtins.readFile ./initExtra.zsh;
  };
}
