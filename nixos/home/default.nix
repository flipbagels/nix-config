{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  imports = [
    ../../modules/shell/bash.nix
    ../../modules/firefox.nix
    ../../modules/git.nix
    # ../../modules/gtk.nix
    ../../modules/kitty.nix
    ../../modules/python.nix
    ../../modules/rust.nix
    ../../modules/vscode.nix
    ../../modules/xdg.nix
  ] ++ [
    ../../modules/hyprland
    ../../modules/gnome.nix
  ];

  home.packages =
    (with pkgs; [
      discord
      gh
      gimp
      kitty
      # libreoffice
      # okular
      openconnect
      ripgrep
      slack
      spotify
      teams-for-linux
      # wineWowPackages.waylandFull
      zoom-us
      zotero_7
    ])
    ++ (with pkgs-unstable; [
      yazi
    ])
    ++ [
      inputs.nixvim.packages.x86_64-linux.default
    ];

  home.username = "lukas";
  home.homeDirectory = "/home/lukas";

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
