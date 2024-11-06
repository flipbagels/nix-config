{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      "mas"
    ];
    casks = [
      "docker"
      "firefox"
      "spotify"
      "zotero"
      "whatsapp"
      "zoom"
    ];
    masApps = {
      "Microsoft-Word" = 462054704;
      "Microsoft-PowerPoint" = 462062816;
      "Microsoft-Excel" = 462058435;
    };
    onActivation.cleanup = "zap";
  };
}
