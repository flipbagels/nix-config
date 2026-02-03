{ config, pkgs, system, ... }:

if system == "x86_64-linux" then
{
  programs.bash = {
    enable = true;
    shellAliases = import ./aliases.nix { inherit system; };
    initExtra = builtins.readFile ./initExtra.sh;
  };
}
else if system == "aarch64-darwin" then
{
  programs.zsh = {
    enable = true;
    shellAliases = import ./aliases.nix { inherit system; };
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
else { }
