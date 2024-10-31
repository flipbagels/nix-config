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
      "whatsapp"
    ];
    masApps = {
    };
    onActivation.cleanup = "zap";
  };
}
