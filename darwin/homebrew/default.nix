{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "swig"
    ];
    casks = [
      "discord"
      "docker"
      "firefox"
      "microsoft-teams"
      "obsidian"
      "slack"
      "spotify"
      "zotero"
      "whatsapp"
      "zoom"
    ];
    masApps = {
      "Microsoft-Word" = 462054704;
      "Microsoft-Outlook" = 985367838;
      "Microsoft-PowerPoint" = 462062816;
      "Microsoft-Excel" = 462058435;
    };
    onActivation.cleanup = "zap";
  };
}
