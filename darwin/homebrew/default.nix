{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      # "mas"
    ];
    casks = [
      "firefox"
      "spotify"
      "zotero"
    ];
    masApps = {
    };
    onActivation.cleanup = "zap";
  };
}
