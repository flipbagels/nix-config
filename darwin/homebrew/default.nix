{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      # "mas"
    ];
    casks = [
      "docker"
      "firefox"
      "spotify"
      "zotero"
    ];
    masApps = {
    };
    onActivation.cleanup = "zap";
  };
}
